defmodule Playground do

  def max(a,b) do
      if a >= b do: a, else: b
  end

  def max(a,b) do
    unless a>b do: b, else: a
  end

  def max(a, b) do
    cond do
      a > b -> a
      true -> b
    end
  end

end
