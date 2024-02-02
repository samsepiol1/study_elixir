defmodule ConversaoNumero do

  def main do
    IO.puts("Digite aqui um número para ser convertido em metros")
    m = IO.gets("") |> String.trim() |> String.to_integer()

    conversao = converter_m_to_mm(m)

    IO.puts("O resultado da conversão é #{conversao}")
  end

  def converter_m_to_mm(m) do
      m * 1000
    end
  end



ConversaoNumero.main()
