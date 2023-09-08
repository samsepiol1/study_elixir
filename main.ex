defmodule Playground do

  # Normal Function
  def area(a, b) do
    a * b
  end

  # Function with no arguments

  def run do
    area(10,20)
  end

# Add Comment for test


  # Clean Way to do one line function
    def area_of_circle(x, y) do: x * y
  end

  # Anon Function
    s = fn x -> x * x end
    s.(2)
    # Output: 4

    x = fn x -> IO.puts x end
    x.("Hello")
    # The ex function
    Enum.each([1,2,3,4], x)
    lambda = fn x, y, z -> z * y + z end
