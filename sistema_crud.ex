defmodule UserCrudServer do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end



  def add_user(server, name, email) do
    GenServer.cast(server, {:add_user, name, email})
  end

  def list_users(server) do
    GenServer.call(server, :list_users)
  end

  def update_user(server, name, new_email) do
    GenServer.cast(server, {:update_user, name, new_email})
  end

  def delete_user(server, name) do
    GenServer.cast(server, {:delete_user, name})
  end

  # Callbacks do GenServer

  def init(_) do
    {:ok, %{}}
  end

  def handle_cast({:add_user, name, email}, state) do
    updated_users = [%{name: name, email: email} | state]
    {:noreply, updated_users}
  end

  def handle_call(:list_users, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:update_user, name, new_email}, state) do
    updated_users = Enum.map(state, fn user ->
      if user.name == name do
        Map.put(user, :email, new_email)
      else
        user
      end
    end)
    {:noreply, updated_users}
  end

  def handle_cast({:delete_user, name}, state) do
    remaining_users = Enum.filter(state, fn user -> user.name != name end)
    {:noreply, remaining_users}
  end
end

defmodule Menu do
  def main do
    {:ok, server} = UserCrudServer.start_link([])
    loop_menu(server)
  end

  def loop_menu(server) do
    IO.puts("""
    Menu:
    1. Adicionar Usuário
    2. Listar Usuários
    3. Atualizar Usuário
    4. Deletar Usuário
    5. Sair
    """)

    IO.write("Escolha uma opção: ")
    choice = String.trim(IO.gets(""))

    case choice do
      "1" -> add_user_menu(server)
      "2" -> list_users_menu(server)
      "3" -> update_user_menu(server)
      "4" -> delete_user_menu(server)
      "5" -> IO.puts("Saindo. Adeus!")
      _ -> IO.puts("Opção inválida. Tente novamente.")
    end
  end

  def add_user_menu(server) do
    IO.write("Nome do usuário: ")
    name = String.trim(IO.gets(""))

    IO.write("Email do usuário: ")
    email = String.trim(IO.gets(""))

    GenServer.cast(server, {:add_user, name, email})
    IO.puts("Usuário adicionado com sucesso.")
    loop_menu(server)
  end

  def list_users_menu(server) do
    users = GenServer.call(server, :list_users)
    IO.inspect(users)
    loop_menu(server)
  end

  def update_user_menu(server) do
    IO.write("Nome do usuário a ser atualizado: ")
    name = String.trim(IO.gets(""))

    IO.write("Novo email: ")
    new_email = String.trim(IO.gets(""))

    GenServer.cast(server, {:update_user, name, new_email})
    IO.puts("Usuário atualizado com sucesso.")
    loop_menu(server)
  end

  def delete_user_menu(server) do
    IO.write("Nome do usuário a ser deletado: ")
    name = String.trim(IO.gets(""))

    GenServer.cast(server, {:delete_user, name})
    IO.puts("Usuário deletado com sucesso.")
    loop_menu(server)
  end
end

Menu.main()
