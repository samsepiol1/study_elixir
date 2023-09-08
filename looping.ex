defmodule Playground do
  def print(0), do: :ok

  def print(n) do
    print(n - 1)
    IO.puts(n)
  end

end
## print(10) => 10 -> print(9)
