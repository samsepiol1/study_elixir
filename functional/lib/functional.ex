defmodule Functional do
  def hello do
      user_data = %{name: "Rafael", age: 27}
      IO.inspect(user_data)

      Map.put(user_data, :name, "João")
      IO.inspect(user_data)
  end
end
