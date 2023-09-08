defmodule Playground do
  def sum([]), do: 0

  def sum(h|t) do
    h + sum(t)
  end
end
