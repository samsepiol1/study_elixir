defmodule SistemaCRUD do
  @moduledoc """
  Sistema CRUD simples em Elixir usando um exemplo de banco de dados e ENUM para leitura de alguns registros
  """

  @state []

  # Função para criar um novo item
  def create_item(database, item) do
    new_database = [item | database]
    {:ok, new_database}
  end

  # Função para ler todos os itens
  def read_items(database) do
    {:ok, database}
  end

  # Função para atualizar um item
  def update_item(database, old_item, new_item) do
    new_database = Enum.map(database, fn
      ^old_item -> new_item
      item -> item
    end)

    {:ok, new_database}
  end

  # Função para deletar um item
  def delete_item(database, item) do
    new_database = Enum.filter(database, &(&1 != item))
    {:ok, new_database}
  end
end

# Exemplo de uso
{:ok, database} = SistemaCRUD.create_item([], "Item 1")
{:ok, database} = SistemaCRUD.create_item(database, "Item 2")
{:ok, items} = SistemaCRUD.read_items(database)
IO.inspect(items)

{:ok, database} = SistemaCRUD.update_item(database, "Item 1", "Novo Item 1")
{:ok, items} = SistemaCRUD.read_items(database)
IO.inspect(items)

{:ok, database} = SistemaCRUD.delete_item(database, "Item 2")
{:ok, items} = SistemaCRUD.read_items(database)
IO.inspect(items)
