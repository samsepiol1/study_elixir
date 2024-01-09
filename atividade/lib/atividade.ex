defmodule Menu do
  def start do
    menu(%{})
  end

  def menu(state) do
    IO.puts("Menu:")
    IO.puts("1. Criar registro")
    IO.puts("2. Ler registro")
    IO.puts("3. Atualizar registro")
    IO.puts("4. Excluir registro")
    IO.puts("5. Sair")

    IO.write("Escolha uma opção: ")
    choice = String.trim(IO.gets(""))

    case choice do
      "1" -> create_record_menu(state)
      "2" -> read_record_menu(state)
      "3" -> update_record_menu(state)
      "4" -> delete_record_menu(state)
      "5" -> IO.puts("Saindo. Adeus!")
      _ -> IO.puts("Opção inválida. Tente novamente.")
    end
  end

  def create_record_menu(state) do
    IO.write("Digite os parâmetros para criar o registro (ex: nome=John, idade=30): ")
    params_input = String.trim(IO.gets(""))
    params = String.split(params_input, ",", trim: true)
              |> Enum.map(&String.split(&1, "=", trim: true))
              |> Enum.into(%{})

    AsyncCrudSystem.create_async(params)
    IO.puts("Operação de criação iniciada.")
    menu(state)
  end

  def read_record_menu(state) do
    IO.write("Digite o ID do registro para ler: ")
    id = String.trim(IO.gets(""))

    result = AsyncCrudSystem.read_async(id)
    IO.inspect(result)
    menu(state)
  end

  def update_record_menu(state) do
    IO.write("Digite o ID do registro para atualizar: ")
    id = String.trim(IO.gets(""))

    IO.write("Digite os novos parâmetros para atualizar o registro (ex: nome=John, idade=30): ")
    params_input = String.trim(IO.gets(""))
    params = String.split(params_input, ",", trim: true)
              |> Enum.map(&String.split(&1, "=", trim: true))
              |> Enum.into(%{})

    AsyncCrudSystem.update_async(id, params)
    IO.puts("Operação de atualização iniciada.")
    menu(state)
  end

  def delete_record_menu(state) do
    IO.write("Digite o ID do registro para excluir: ")
    id = String.trim(IO.gets(""))

    AsyncCrudSystem.delete_async(id)
    IO.puts("Operação de exclusão iniciada.")
    menu(state)
  end
end
