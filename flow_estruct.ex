if String.valid?("Hello") do
  "Valid String"
else
  "Invalid String"
end

if "a string value" do
  "Truthy"
end

unless is_integer("Hello") do
  "Not an int"
end

case {:ok, "Hello World"} do
  {:ok, result} -> result
  {:error} -> "Uh, oh"
  _ -> "Catch All"
end

case {1, 2, 3} do
  {1, x, 3} when x > 0 ->
    "Will Match"
  _ ->
    "Won't Match"
end
