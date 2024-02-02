defmodule RequestsTest do
  use ExUnit.Case
  doctest Requests

  test "greets the world" do
    assert Requests.hello() == :world
  end
end
