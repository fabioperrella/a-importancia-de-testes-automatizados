# Guia de Sobrevivência Dev - A importância de testes automatizados

## Quem sou eu

Fabio Perrella

Líder técnico na Locaweb

Formado na Poli-USP, Engenharia de Computação

Algumas tecnologias que uso no dia a dia: Ruby, Ruby on Rails, Postgres, Sidekiq, Redis, Git, Docker, Mysql, Bash Script, JS, PHP, etc..

Comecei a programar de verdade em 2005!

Usando Ruby desde 2009!

Links:

- https://twitter.com/fabioperrella
- https://www.linkedin.com/in/fabio-perrella-8247976/
- https://github.com/fabioperrella

## Problema a resolver

Regra de negócio 1: Fazer um método `lalapopo` que retorne `false` para números ímpares e `true` para números pares

```ruby
def lalapopo(number)
  if number % 2 == 0
    true
  else
    false
  end
end
```

## Como ver se está certo?

Rodar o método que foi feito com diferentes entradas, ex:

```ruby
lalapopo(1) # deve retornar false
lalapopo(2) # deve retornar true
lalapopo(3) # deve retornar false
#...
```

## Aí aparece um requisito novo!

Regra de negócio 2: Deve retornar false se o número for entre 10 e 15

## Isso requer uma mudança na implementação

```ruby
def lalapopo(number)
  if number >= 10 && number <= 15
    return false
  end

  if number % 2 == 0
    true
  else
    false
  end
end
```

## Agora será necessário checar a 1a e 2a regra de negócio

```ruby
lalapopo(1) # deve retornar false
lalapopo(2) # deve retornar true
lalapopo(3) # deve retornar false
lalapopo(10) # deve retornar false
lalapopo(11) # deve retornar false
lalapopo(15) # deve retornar false
lalapopo(16) # deve retornar true
#...
```

## Os testes automatizados ajudam a automatizar essa checagem!

Exemplo de teste automatizado:

```ruby
def lalapopo(number)
  # introduzi um bug trocando o ">= 10" por "> 10"
  if number > 10 && number <= 15
    return false
  end

  if number % 2 == 0
    true
  else
    false
  end
end

# aqui começam os testes

if lalapopo(1) != false
  puts "deveria retornar false para 1"
end

if lalapopo(2) != true
  puts "deveria retornar true para 2"
end

if lalapopo(3) != false
  puts "deveria retornar false para 3"
end

if lalapopo(10) != false
  puts "deveria retornar false para 10"
end

if lalapopo(11) != false
  puts "deveria retornar false para 11"
end

if lalapopo(15) != false
  puts "deveria retornar false para 15"
end

if lalapopo(16) != true
  puts "deveria retornar true para 16"
end
```

## Frameworks de testes

Ajudam a deixar os testes mais fáceis de se fazer e de se ler. Exemplos:

- Ruby: [Rspec](https://rspec.info/)
- Javascript: [Jest](https://jestjs.io/)
- PHP: [PHPUnit](https://phpunit.de/)

## Exemplo de como ficaria com o Rspec

```ruby
# code.rb
def lalapopo(number)
  # introduzi um bug trocando o ">= 10" por "> 10"
  if number > 10 && number <= 15
    return false
  end

  if number % 2 == 0
    true
  else
    false
  end
end

# code_spec.rb
require 'rspec'
require './code'

describe 'lalapopo' do
  it "returns false for odd numbers" do
    expect(lalapopo(1)).to eq(false)
    expect(lalapopo(3)).to eq(false)
  end

  it "returns true for even numbers" do
    expect(lalapopo(2)).to eq(true)
    expect(lalapopo(4)).to eq(true)
  end

  it "returns false for numbers between 10 and 15" do
    expect(lalapopo(10)).to eq(false)
    expect(lalapopo(11)).to eq(false)
    expect(lalapopo(14)).to eq(false)
    expect(lalapopo(15)).to eq(false)
    expect(lalapopo(16)).to eq(true)
  end
end
```

## Vantagens de uso de testes

- automatizar checagem para ver se todas as regras de negócio estão ok
- serve como documentação do código
- ajuda em uma futura refatoração do código
- ajuda no "design" do código. Ver mais detalhes sobre [TDD](https://www.devmedia.com.br/test-driven-development-tdd-simples-e-pratico/18533)

## Repositório dessa apresentação

- https://github.com/fabioperrella/a-importancia-de-testes-automatizados