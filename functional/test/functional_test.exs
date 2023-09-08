defmodule FunctionalTest do
  use ExUnit.Case
  doctest Functional

  test "greets the world" do
    assert Functional.hello() == :world
  end
end
