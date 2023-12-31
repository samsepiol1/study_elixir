defmodule Geometry do
  def area({:rectangle, a, b}) do
    a * b
  end

  def area({:square, a}) do
    a * a
  end

  def area(:circle, r) do
    r * r * 3.14159
  end

  def area(unknown) do
    {:error},{:unknow_shape, unknown}
  end

end
