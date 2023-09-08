defmodule Greeter2 do
  def hello(), do: "Hello, Anonymous Person" #hello/0
  def hello(name) , do:"Hello", <> name     #hello/1
  def hello(name, name2), do: "Hello, #{name1} and #{name2}" #hello/2
end

defmodule Greeter1 do
  def hello(${name: person_name}) do
      IO.puts "Hello, " <> person_name
  end
end

fred = %{
  name: "Fred",
  age: "95",
  favorite_color: "Taupe"
  }

# Call with entire map
Greeter1.hello(fred)
"Hello, fred"
