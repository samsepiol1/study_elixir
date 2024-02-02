defmodule CalculadoraDesconto do
  def main do
    IO.puts("Digite o preço da mercadoria:")
    preco_mercadoria = IO.gets("")|> String.trim() |>String.to_integer()

    IO.puts("Digite o percentual de desconto:")
    percentual_desconto = IO.gets("")|> String.trim() |>String.to_integer()

    {valor_desconto, preco_pagar} = calcular_desconto(preco_mercadoria, percentual_desconto)

    IO.puts("O valor do desconto é: #{valor_desconto}")
    IO.puts("O preço a pagar é: #{preco_pagar}")
  end

  def calcular_desconto(preco_mercadoria, percentual_desconto) do
    valor_desconto = (percentual_desconto / 100) * preco_mercadoria
    preco_pagar = preco_mercadoria - valor_desconto
    {valor_desconto, preco_pagar}
  end
end

CalculadoraDesconto.main()
