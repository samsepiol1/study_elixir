# Elixir
Elixir é uma linguagem de programação funcional. Com linguagens funcionais como Elixir, podemos fazer melhor uso de nossos multinúcleos de CPU e escrever códigos mais curtos e explícitos. Para entender melhor a programação funcional, devo primeiro apresentar os seguintes princípios fundamentais: imutabilidade, funções e código declarativo.

Na programação funcional, todos os valores criados no programa são imutáveis. Por padrão, cada função possui um valor estável, o que significa que mecanismos de bloqueio não são necessários. Isso simplifica o trabalho paralelo. A imutabilidade está aparecendo mais nas linguagens de programação convencionais. Essas linguagens normalmente fornecem o mecanismo imutável, fornecendo uma alternativa de tipo de dados imutável ou um método para tornar um valor imutável.

A sintaxe Elixir compartilha muitas semelhanças com a sintaxe Ruby e é amplamente usada para construir aplicativos tolerantes a falhas, escaláveis ​​e de fácil manutenção. A linguagem fornece escalabilidade, simultaneidade, tolerância a falhas e baixa latência.

A linguagem também possui um conjunto sólido de ferramentas de desenvolvimento web, como:

Mix: Mix é uma ferramenta de construção que permite criar projetos, executar testes, gerenciar tarefas e muito mais.
IEx: IEx, o shell interativo do Elixir, oferece muitos recursos como preenchimento automático, depuração, recarregamento de código e muito mais.
Phoenix: Phoenix é conhecido por ser um dos melhores frameworks web. É baseado na arquitetura MVC, assim como Ruby on Rails.

## Tipos Primitivos

### Strings

Elixir usa o padrão UTF-8 para codificação de Strings. As Strings são iguais em qualquer outra linguagem. No exemplo abaixo temos uma saída de uma string no terminal.



```elixir
  IO.puts("Hello, World!")
```

### Átomos

Átomos são constantes cujo o valor é são seus propios nomes. Em outras linguagens, como ruby por exemplo, Átomos são chamados de símbolos. 

```elixir

iex> :cat
:cat
iex> :dog
:dog
iex> :fish
:fish

```

### Booleanos
Booleanos são valores que podem assumir verdadeiro ou falso
```elixir
true

true==false

```

### KeyWord List
Quando temos uma lista de tuplas e o primeiro item da tupla possui um átomo chamamos essa estrutura de Keyword List. Abaixo vemos um exemplo de KeyWord List

```elixir
list = [{:c, 1}, {:d, 2}]
[c: 1, d: 2]
iex> list == [c: 1, d: 2]
true
```

### Módulos e funções 

No elixir as funções são agrupadas em módulos, no exemplo abaixo vemos chamadas de funções e uma função simples:

```elixir
String.length("elixir")
```

```elixir
defmodule Playground do
  #Normal Function
  def area(a, b) do
    a * b
  end
end
```

Importante ressaltar que no elixir não existe a palavra chave return, portanto, o retorno é baseado na saída da última linha. Embaixo tem um exemplo de função sem argumentos

```elixir
  # Function with no arguments

  def run do
    area(10,20)
  end
```

Quando se tem um retorno de uma linha é possível fazer isso da seguinte maneira: 

```elixir
 # Clean Way to do one line function
    def area_of_circle(x, y) do: x * y
  end
```
#### Funções Anonimas
Tal como o nome indica, uma função anônima não tem nome. Como vimos na lição Enum, elas são frequentemente passadas para outras funções. Para definir uma função anônima em Elixir nós precisamos das palavras-chave fn e end. Dentro destes, podemos definir qualquer número de parâmetros e corpos separados por ->.

```elixir
# Anon Function
    s = fn x -> x * x end
    s.(2)
    # Output: 4

sum = fn (a, b) -> a + b end
sum.(2, 3)

```

### Pattern Matching
Pattern Matching é uma forma de associar uma expressão em elixir. Pattern Matching não pode ser limitado apenas a associação com variáveis, podemos executar isso com funções. 

```elixir
{name,age} = {"John", 25}
name #Output: "John"
age #Output: 25
```

Operador _ permite que você não faça associação diretas aos valores sendo bem útil quando você quer utilizar constantes. O operador _ também chamada de variável anonima

```elixir
{_, x} = {11, "Hello"}
```

A utilidade de pattern matching com funções no permite criar múltiplas clausulas para a função. Elixir utiliza pattern matching para verificar todas as possíveis opções de match e identificar o primeiro conjunto de parâmetros associados para executar seu respectivo corpo.

```elixir
handle_result = fn
  {:ok, result} -> IO.puts "Handling result..."
  {:ok, _} -> IO.puts "This would be never run as previous will be matched beforehand."
  {:error} -> IO.puts "An error has occurred!"
end
```
Nesse código, associamos uma função anonima a uma variável que pode retornar três tipos de resultados diferentes conforme a entrada da tupla. Abaixo vemos um outro exemplo de pattern matching aplicado em um função nomeada

```elixir
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
```

Dê a você uma variável/valor, você pode querer

1. Verifique se o tipo de dados corresponde ao tipo de dados esperado
2. Verifique se a estrutura dos dados corresponde à estrutura de dados esperada
3. Atribuir parte correspondente dos dados a uma variável

exemplos

verificar se os dados são mapas

```elixir
%{} = params
```

podemos, por exemplo, fazer três verificações: verificar se os dados são um mapa, tem a chave email e o valor email é corresponde a um determinado input

```elixir
%{"email" => "zoo@example.com"} = params
```

Atribuição de variáveis. Nesse caso, ele ira fazer a verificação se existe a chave email na tupla, se possuir, o valor da chave email irá ser atríbuida a variável my_email

%{"email" => my_email} = params

Podemos fazer o mesmo caso com variáveis anonimas.

```elixir
%{"email" => _} = params
```

verificação do tipo struct
```elixir
%User{} = params
```
Verifique se os dados são tuplas e têm valor específico

```elixir
{:ok, data} = result
# you use this most of time
```





### Funções nomeada
Nós podemos definir funções com nomes para referir a elas no futuro, estas funções nomeadas são definidas com a palavra-chave def dentro de um módulo. Nós iremos aprender mais sobre Módulos nas próximas lições, por agora nós iremos focar apenas nas funções nomeadas. Abaixo vemos um exemplo de função nomeada que retorna o tamanho de uma lista

```elixir
defmodule Length do
  def of([]), do: 0
  def of([_ | tail]), do: 1 + of(tail)
end
```
### Guards
Guards podem ser vistos com um complemento a pattern Matching podendo realizar atividades mais complicadas quando combinado. Normalmente, por convenção, são usados após pattern matching e podem produzir as mesmas saídas. 

```elixir
# sum on empty list
# pattern matching
def sum_list([] = _input), do: 0

# guard
def sum_list(input) when input == [], do: 0
```
Abaixo alguns exemplos de funções que utilizam guards

```elixir
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

```

### Macros
Embora o Elixir faça o possível para fornecer um ambiente seguro para macros, a principal responsabilidade de escrever código limpo com macros recai sobre os desenvolvedores. Macros são mais difíceis de escrever do que funções comuns do Elixir e é considerado um estilo ruim usá-las quando não são necessárias. Portanto, escreva macros com responsabilidade.

Elixir já fornece mecanismos para escrever seu código diário de forma simples e legível, usando suas estruturas de dados e funções. Macros só devem ser usadas como último recurso. Lembre-se de que explícito é melhor que implícito . Código claro é melhor do que código conciso.

Abaixo podemos ver um exemplo prático de Macros onde temos funções privadas(defp) que não podem ser usadas fora do escopo do módulo. A função principal invocar as outras funções com intuito de extrair o resultado a qual foi verificado previamente nas outras funções e no final irá exibir o resultado capturado das outras funções

```elixir
defmodule Playground do
  def extract_user(user) do
    with{:ok, login} <- extract_login(user),
        {:ok, email} <- extract_email(user),
        {:ok, password} <- extract_password(user) do
          {:ok, %{login: login, email: email, passoword: password}}
        end
  end

  # Private functions cannot be used outside the module playground

  defp extract_login %({"login" -> login}), do: {:ok, login}
  defp extract_login(_), do: {:error, "login missing"}
  defp extract_email(%{"email"} -> email), do:{:ok, email}
  defp extract_email(_), do: {:error, "email missing"}
  defp extract_password(%{"password"} -> password), do: {:ok, password}
  defp extract_password(_), do:{:error, "password missing"}

end
```















