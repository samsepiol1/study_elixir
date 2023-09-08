defmodule Playground do

  def test(x) when x < 0 do
      :negative
  end

  def test(0) do: :zero

  def test(x) when x > 0 do
    :positive
  end

end

# Check Primitive type
def sum(a,b) when is_integer (a) and is_integer(b) do
  a + b
end


#Check if value is nil/not nil
def string_lenght(string) when not is_nill(string) do
  #Your code
end

#Check if input in a lista of allowed values

def can_edit(%User{role: role}) when role in ["Admin", "Moderator"] do
  true
end
