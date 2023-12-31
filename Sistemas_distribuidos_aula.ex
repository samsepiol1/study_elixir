# Implementando todo em código em funções

defmodule Funcoes do
  def ola_mundo do
    IO.puts("Olá mundo!")
  end

  def ola_nome do
    IO.puts("Digite seu nome: ")
    nome = IO.gets("") |> String.trim()
    IO.puts("Olá #{nome}!")
  end

  def ola_idade do
    IO.puts("Digite seu nome: ")
    nome = IO.gets("") |> String.trim()
    IO.puts("Digite seu ano de nascimento: ")
    ano_nascimento = IO.gets("") |> String.trim() |> String.to_integer()
    idade = Date.utc_today().year - ano_nascimento
    IO.puts("Olá #{nome}, você tem #{idade} anos.")
  end

  def calcular_imc do
    IO.puts("Digite seu nome: ")
    nome = IO.gets("") |> String.trim()
    IO.puts("Digite seu peso em Kg: ")
    peso = IO.gets("") |> String.trim() |> String.to_float()
    IO.puts("Digite sua altura em centímetros: ")
    altura_cm = IO.gets("") |> String.trim() |> String.to_float()
    altura_m = altura_cm / 100
    imc = peso / (altura_m * altura_m)
    IO.puts("Olá #{nome}, seu IMC é de #{imc}.")
  end

  def exibir_inverso do
    IO.puts("Digite a quantidade de números: ")
    quantidade = IO.gets("") |> String.trim() |> String.to_integer()
    numeros = ler_numeros(quantidade)
    IO.puts("Números na ordem inversa:")
    Enum.reverse(numeros) |> Enum.each(&IO.puts(&1))
  end

  defp ler_numeros(0), do: []
  defp ler_numeros(n) do
    IO.puts("Digite o número #{n}: ")
    [numero | resto] = ler_numeros(n - 1)
    [String.trim(IO.gets("")) |> String.to_integer() | numero | resto]
  end

  def criar_pontos do
    IO.puts("Criar - Entre com os pontos do polígono.")
    # Implemente a lógica para criar pontos do polígono
  end

  def listar_pontos do
    IO.puts("Listar - Listagem dos pontos do polígono.")
    # Implemente a lógica para listar pontos do polígono
  end

  def atualizar_pontos do
    IO.puts("Atualizar - Atualização dos pontos do polígono.")
    # Implemente a lógica para atualizar pontos do polígono
  end

  def excluir_pontos do
    IO.puts("Excluir - Exclusão dos pontos do polígono.")
    # Implemente a lógica para excluir pontos do polígono
  end

  def sair do
    IO.puts("Saindo do programa.")
  end
end

defmodule Menu do
  def principal do
    loop()
  end

  def loop do
    IO.puts("""
    Sistema Final
    =============
    1. Criar
    2. Listar
    3. Atualizar
    4. Excluir
    5. Sair

    Entre com sua opção:
    """)

    opcao = IO.gets("") |> String.trim() |> String.to_integer()

    case opcao do
      1 -> Funcoes.criar_pontos()
      2 -> Funcoes.listar_pontos()
      3 -> Funcoes.atualizar_pontos()
      4 -> Funcoes.excluir_pontos()
      5 -> Funcoes.sair()
      _ -> IO.puts("Opção inválida. Tente novamente.")
    end

    unless opcao == 5 do
      loop()
    end
  end
end

Menu.principal()
