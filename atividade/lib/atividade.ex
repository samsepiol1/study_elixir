defmodule AsyncCrudSystem do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def create_async(params) do
    GenServer.cast(__MODULE__, {:create, params})
  end

  def read_async(id) do
    GenServer.call(__MODULE__, {:read, id})
  end

  def update_async(id, params) do
    GenServer.cast(__MODULE__, {:update, id, params})
  end

  def delete_async(id) do
    GenServer.cast(__MODULE__, {:delete, id})
  end

  # Funções do GenServer

  def init(_) do
    {:ok, %{}}
  end

  def handle_cast({:create, params}, state) do
    Task.start_link(fn ->
      create_record(params)
    end)
    {:noreply, state}
  end

  def handle_call({:read, id}, _from, state) do
    result =
      Task.await(
        Task.start_link(fn ->
          read_record(id)
        end)
      )
    {:reply, result, state}
  end

  def handle_cast({:update, id, params}, state) do
    Task.start_link(fn ->
      update_record(id, params)
    end)
    {:noreply, state}
  end

  def handle_cast({:delete, id}, state) do
    Task.start_link(fn ->
      delete_record(id)
    end)
    {:noreply, state}
  end

  # Funções privadas

  defp create_record(params) do
    # Simula a lógica de criação do registro
    IO.puts("Criando registro: #{inspect(params)}")
  end

  defp read_record(id) do
    # Simula a lógica de leitura do registro
    IO.puts("Lendo registro com ID #{id}")
    %{id: id, dados: "Exemplo de dados"}
  end

  defp update_record(id, params) do
    # Simula a lógica de atualização do registro
    IO.puts("Atualizando registro com ID #{id} - Novos dados: #{inspect(params)}")
  end

  defp delete_record(id) do
    # Simula a lógica de exclusão do registro
    IO.puts("Excluindo registro com ID #{id}")
  end
end
