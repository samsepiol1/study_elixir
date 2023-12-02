<center><h2>Meus Estudos em Elixir</h2></center>
<p align="center"><a href="https://elixir.com" target="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Official_Elixir_logo.png/320px-Official_Elixir_logo.png" width="400" alt="Elixir Logo"></a></p>

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
### Data Abstraction

Esta abordagem geralmente não é usada no Elixir. Por ser uma linguagem funcional, o Elixir promove a dissociação dos dados do código. Em vez de classes, você usa módulos, que são coleções de funções. Em vez de chamar métodos em objetos, você chama explicitamente funções de módulo e fornece dados de entrada por meio de argumentos.

```elixir
defmodule TaskList do
  def new() do: %{}

  def add_task(task_list, data, body) do
    Map.update(
      task_list,
      date
      [body],
      fn tasks -> [body|tasks] end
    )

    #Query Function
    def get_tasks(task_list, date) do
      Map.get(task_list, date, [])
    end
  end
end
```

### Concorrência

A simultaneidade é uma ótima técnica para aplicar na criação de uma aplicação, ela traz capacidade de resposta, ajuda a melhorar a escalabilidade e distribuição e ainda por cima traz muitas preocupações extras também. Por causa disso, a tecnologia usada no desenvolvimento de tal aplicação deve ser madura o suficiente para esse cenário, caso contrário, você terá que tomar cuidado com as clássicas armadilhas de simultaneidade e os problemas específicos da sua aplicação.

A ferramenta básica e mais poderosa do modelo de simultaneidade BEAM são seus processos, não os processos criados pelo sistema operacional, o BEAM é um deles, mas os processos criados e gerenciados por ele são uma versão mais leve. Uma aplicação rodando na máquina virtual Erlang pode fazer uso de vários processos para executar funções em paralelo, tanto quanto possível, em um fluxo mais escalável do que lidar com um processo comum.

<p align="center"><a href="www.elixir.com" target="_blank"><img src="https://www.poeticoding.com/wp-content/uploads/2019/03/featured_concurrent_requests.png" alt="Elixir Logo"></a></p>

Criamos um spawn para que cada requisição seja feita e executada ao mesmo(de forma concorrente). A spawn(func) função cria um processo Erlang, retorna um PID (um ID de processo exclusivo) e executa a função passada dentro deste novo processo. Dessa forma, as requisição se tornam simultaneas executando cada um em um processo. 

```elixir
pid_btc = spawn fn -> 
  Coinbase.print_price("BTC-USD")
end
```

Com um exemplo mais simples: temos a soma de dois números que só vai ser possível após uma função anterior a ele ser executada. Ou seja, se tivermos mais de uma soma para realizar esse será um longo processo e o tempo de execução pode não ser tão rápido assim quando lidamos com operações de somas consecutivas. A função Spawn o recebe como parâmetro outra função que será executada em um novo processo, o chamador da função spawn pode continuar seu trabalho enquanto outro processo é emitido para a chamada.

```elixir
# Without spawn function
sum_maker = fn num, num2 ->
  Process.sleep(5000)
  IO.puts("#{num1} + #{num2} = #{num1 + num2}")


# With Spawn Function
async_sum = fn num1, num2 ->
  spawn(fn -> sum_maker(num1, num2) end)
```

#### Pequeno processo de servidor

No contexto do código abaixo usamos a comunicação entre atores do elixir onde por meio do PID podemos enviar uma mensagem para o processo. Para que possamos recuperar a mensagem que foi enviada usamos a função recive. Um exemplo do nosso código inical pode ser visto abaixo: 

```elixir
sum_maker = fn num1, num2 ->
  Process.sleep(5000)
  num1 + num2
end

async_sum = fn num1, num2 ->
  caller = self()
  spawn(fn -> send(caller, {:result, sum_maker.(num1, num2)}) end)
end
```


O codigo abaixo é um exemplo simplificado de servidor onde criamos um loop para poder segurar as mensagens. Quando a mensagem é recebida e o processo executado o ciclo continua. Podemos gerenciar o status dos recebimentos da mensagens por meio da função get_last. 

```elixir
defmodule Calculator do
  def start, do: spawn(&register/0)
  def register do
    Process.register(self(), :calculator)
    loop(0)
  end
  def loop(state) do
    next_state =
      receive do
        {:sum, caller, num1, num2} ->
          sum = sum_maker(num1, num2)
          send(caller, {:result, sum})
          sum
        {:last, caller} ->
          send(caller, {:last, state})
          state
      end
    loop(next_state)
  end
def get_last do
    send(:calculator, {:last, self()})
    receive do
      {:last, value} ->
        IO.puts("Your last call was #{value}")
      after
        2000 -> IO.puts("Can't fetch your lastest call.")
    end
  end
```

### Sigils
É um atalho para criar algum tipo de dado. De acordo com a documentação: Elixir fornece uma sintaxe alternativa para representar e trabalhar com literais. Um sigil (símbolo especial) vai começar com um til ~ seguido por um caractere. O núcleo do Elixir fornece-nos alguns sigils, no entanto, é possível criar o nosso próprio quando precisamos estender a linguagem.

```elixir

defmodule Elixir13 do
  def main do
    ["casa", "prédio", "barraco"]

    # Ambos são a mesma coisa, porém representadas de formas diferentes

    ~w(casa predio barraco)


    # Exemplo de aplicação com expressão regular
    "elixir1" =~ ~r/elixir/

  end

```

~C Gera uma lista de caracteres sem escape ou interpolação
~c Gera uma lista de caracteres com escape e interpolação
~R Gera uma expressão regular sem escape ou interpolação
~r Gera uma expressão regular com escape e interpolação
~S Gera strings sem escape ou interpolação
~s Gera string com escape e interpolação
~W Gera uma lista sem escape ou interpolação
~w Gera uma lista com escape e interpolação
~N Gera uma NaiveDateTime struct

Com a linguagem é possível criar seu próprio sigils personalizado como segue o exemplo abaixo

```elixir
defmodule sigil_u(string, []) do
  def sigil_u(string[], do: String.upcase(string)) # Transforma em letra minuscula
end
```


### Servidores Genericos

É um dos módulos que compõem o pacote OTP. É possível acessar ele a partir do elixir graças a interoperabilidade da linguagem. O Gen Server é um tipo de processo como os demais processos que podem ser gerados na linguagem. A principal diferença de um GenServer para os demais é que você pode criar um processo do tipo GenServer como se fosse um servidor que acaba não interferindo na sua aplicação principal. 

O ciclo de vida do seu GenServer tende a funcionar da seguinte maneira: inicia -> loop(chama uma função -> gera um novo estado).

Ex:
Suponhamos que você tenha utilizado o GenServer para implementar uma pilha, seria mais ou menos assim:
```elixir
defmodule Stack do
  use GenServer

  # {...} Outras implementações como init, start_link, etc...

  def handle_call(:pop, _from, [value | state]), do: {:reply, value, state}
  def handle_call(:pop, _from, []), do: {:reply, nil []}

  def handle_cast({:push, value}, state), do: {:no_reply, [value | state]}

  def push(value), do: GenServer.cast(__MODULE__, {:push, value})
  def pop(), do: GenServer.call(__MODULE__, :pop)
end

```

### Como criar Processos
Um processo é algo que pode fazer coisas de forma isolada e concorrente. Vamos tentar um exemplo mais concreto. Digamos que você seja um rato. Você pode fazer várias coisas que os ratos fazem, como se esconder ou comer queijo por exemplo. Você é independente, não precisa de outras pessoas para fazer o que quer e eles não interferem nas suas atividades. Ou seja, você faz isso de forma isolada. Em um concurso de ratos para ver qual come mais queijo, todos poderiam fazer isso de forma concorrente e paralela. Todos comem ao mesmo tempo e não um de cada vez.

Agora que temos uma noção do que é um processo, vamos imaginar que você quer fazer um novo amigo, ou seja, outro processo. Então vamos criar o processo gato. É possível fazer isso com a função spawn.

```elixir
defmodule Gato do
  def criar do
    IO.puts("Você criou um gato")
end
end

#Cria um gato
spawn(Gato, :criar. [])

# Resultado: Você criou um gato
```

### Comunicação entre processos
Depois de criar um processo Gato, lembre-se, você quer que ele comunique com o seu amigo gato. No entanto, os processos são isolados, como podemos fazer isso?

#### Envio e recebimento de mensagem
Enviamos uma mensagem com a função send/2. Passamos para essa função duas coisas: o destinatário da mensagem e qual é a mensagem. Mas como nosso código vai saber enviar a mensagem para o processo gato? Ainda bem que a função spawn retorna pra gente um identificador do processo criado, como se fosse seu endereço. Então vamos salvar o retorno de spawn na variável gato. Agora é só enviar a mensagem.

```elixir
defmodule Gato do:
  def criar do 
    recive do
    :eai_beleza -> IO.Puts("De Boas")
    end
  end
end

# Cria um gato
gato = spawn(Gato, :criar, [])

# Manda mensagem
send(gato, :eai_beleza)

# Resultado
"De Boas"
```

### Responda um outro processo
Nosso código tem um problema. Imagine o IO.puts("De boas") como se o gato tivesse falado isso. Mas vocês estão em suas próprias casas, lembra? Então você não ouviu a resposta dele. Como os processos se comunicam com mensagens, ele teria que te mandar uma mensagem de volta.

```elixir
# gato.exs
defmodule Gato do
  def criar do
    receive do
      {:e_ai_beleza, remetente} -> send(remetente, :de_boas)
    end
  end
end

# Esse é você
rato = self()

# Cria um gato
gato = spawn(Gato, :criar, [])

# Manda mensagem
send(gato, {:e_ai_beleza, rato})

receive do
  :de_boas -> IO.puts("Massa!")
end

# Resultado
# Massa!
```

### Processo temporário
Basicamente, um processo temporário, é quando um processo morre após executar sua função. 

```elixir
defmodule Gato do
  def criar do
    receive do
      {:e_ai_beleza, remetente} -> send(remetente, :de_boas)
    end
  end
end

# Esse é você
rato = self()

# Cria um gato
gato = spawn(Gato, :criar, [])

IO.puts("Gato está vivo? #{Process.alive?(gato)}")

# Manda mensagem
send(gato, {:e_ai_beleza, rato})

receive do
  :de_boas -> IO.puts("Massa!")
end

IO.puts("Gato está vivo? #{Process.alive?(gato)}")

# Resultado
# Gato está vivo? true
# Massa!
# Gato está vivo? false
```

### Processo permanente
Para manter o processo vivo vamos dizer que ele não responde apenas uma mensagem. Ele vai ficar checando das mensagens e respondendo. Podemos fazer isso definindo a função checar_mensagens/0 e passar o bloco receive para ela.


```elixir
defmodule Gato do
  def criar do
    checar_mensagens()
  end

  def checar_mensagens do
    receive do
      {:e_ai_beleza, remetente} -> send(remetente, :de_boas)
    end

    checar_mensagens()
  end
end

# Esse é você
rato = self()

# Cria um gato
gato = spawn(Gato, :criar, [])

IO.puts("Gato está vivo? #{Process.alive?(gato)}")

# Manda mensagem
send(gato, {:e_ai_beleza, rato})

receive do
  :de_boas -> IO.puts("Massa!")
end

IO.puts("Gato está vivo? #{Process.alive?(gato)}")

# Resultado
# Gato está vivo? true
# Massa!
# Gato está vivo? true


```
























