defmodule SomaDoisNumeros do
  def main do
    IO.puts("Digite o primeiro número:")
    numero1 = IO.gets("") |> String.trim() |> String.to_integer()

    IO.puts("Digite o segundo número:")
    numero2 = IO.gets("") |> String.trim() |> String.to_integer()

    soma = soma(numero1, numero2)

    IO.puts("A soma dos dois números é: #{soma}")
  end

  def soma(a, b) do
    a + b
  end
end

SomaDoisNumeros.main()
