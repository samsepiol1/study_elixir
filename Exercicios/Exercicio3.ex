defmodule AumentoSalario do

  def main do
    IO.puts "Digite aqui o valor do salário"
    atual_salario = IO.gets("")|> String.trim() |>String.to_integer()

    IO.puts "Digite aqui o valor do aumento em %:"

    aumento_porcentagem  = IO.gets("")|> String.trim() |> String.to_integer()

    {aumento_decimal,aumento_salario} = calaumento(atual_salario, aumento_porcentagem)

    IO.puts("O valor do novo salário com o aumento é: #{aumento_salario} R$, Houve um aumento de: #{aumento_decimal}")



  end

  def calaumento(atual_salario, aumento_porcentagem) do
    aumento_decimal = (aumento_porcentagem / 100) * atual_salario
    aumento_salario = trunc(aumento_decimal) + atual_salario
    {aumento_decimal,aumento_salario}

  end

end

AumentoSalario.main()
