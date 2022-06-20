# C3 : Normalização

## Relações

## Conversão do Modelo EA para Modelo Relacional

### Passo 1: Entidades e Atributos

ARTIGO (<ins>codigo</ins>, nome, cauçao, tempo limite)

CLIENTE (<ins>codigo</ins>, nCC, telemovel, email, nome)

DEPARTAMENTO (<ins>numero</ins>, nome, {localizaçao})

FUNCIONARIO (<ins>id</ins>, nCC, nome, email, salario, dn)

ALUGUER (<ins>id</ins>, data)

PONTO_DE_ALUGUER (nome, <ins>id</ins>, {localização})


### Passo 2: Associações 1:1 
Nao existem ligações 1:1


### Passo 3: Associações 1:N

ARTIGO (<ins>codigo</ins>, nome, cauçao, tempo limite)

CLIENTE (<ins>codigo</ins>, nCC, telemovel, email, primeiro nome, ultimo nome)

ALUGUER (<ins>id</ins>, data, #<ins>codigo</ins>-> ARTIGO, #<ins>id</ins> -> PONTO_DE_ALUGUER, #<ins>codigo</ins> -> CLIENTE)
 
PONTO_DE_ALUGUER (nome, <ins>id</ins>, {localização})

DEPARTAMENTO (<ins>numero</ins>, nome, {localizaçao}, #<ins>id</ins> -> PONTO_DE_ALUGUER)


### Passo 4: Associações N:M

DEPARTAMENTO_FUNCIONARIO ((#<ins>id</ins> -> FUNCIONARIO, #<ins>numero</ins> -> DEPARTAMENTO), cargo))

LINHA_ALUGUER ((#<ins>codigo</ins> -> ARTIGO, #<ins>id</ins> -> ALUGUER), quantidade)





## Relações


|Artigo     |      |      |      |
|-----------|----|------|---|
|<ins>Código</ins>|nome|caução|tempolimite|

|Cliente     |            |             |            |            |            |
|-------------|------------|------------|------------|------------|------------|
|<ins>Código</ins>|ncc|telemóvel|email|primeironome|ultimonome|

|Aluguer    |    |                 |                    |                  |                    |
|---------|----|-----------------|--------------------|--------------------|--------------------|
|<ins>id</ins>|data|entrega|#<ins>código</ins>->Artigo|#<ins>id</ins>->Ponto_de_Aluguer|#<ins>código</ins>->Cliente|

|Ponto_De_Aluguer  |       |          |  |          |
|----------|-------|----------|----------|----------|
|<ins>id</ins>|nome|rua|porta|#<ins>códigopostal</ins>->Código_Postais|

|Funcionário  |         |          |         |                        |           |       |           |
|---------|---------|----------|---------|------------------------|-----------|-----------|-----------|
|<ins>id</ins>|ncc|primeironome|ultimonome|email|salário|dn|#<ins>numero</ins>->Departamento|

|Departamento|    |         |         |       |         |         |
|----------|----|---------|---------|---------|---------|---------|
|<ins>numero</ins>      |nome|#<ins>código_Postal</ins>->Códigos_Postais|rua|porta|#<ins>id</ins>->Ponto_De_Aluguer|#<ins>id</ins>->Funcionário


|DepartamentoFuncionário|    |           |
|-------|----|-----------|
|#<ins>id</ins>->Funcionario|#<ins>numero</ins>->DEPARTAMENTO|cargo|

|LinhaAluguer     |        |       |  
|------------|--------|-------|
|#<ins>código</ins>->Artigo|#<ins>id</ins>->Aluguer|


|Códigos_Postais         |                        |
|-------------------|------------------------|
|<ins>código_postal</ins>|localidade|

















## Normalização do Esquema Relacional
_(Apresentar o estudo da normalização das relações obtidas na secção anterior. Desnormalizar se necessário.)_


### Dependências Funcionais

### DF1
codigoCliente -> primeiroNome, ultimoNome


### DF2
códigoArtigo -> nome, caução, tempoLimite

###DF3
númeroDepartamento -> nome

nome -> localização

númeroDepartamento -> localização (dependência funcional transitiva)

### DF4
idFuncionario -> nome, salario, dn

### DF5
idAluguer -> data

### DF6
idPontoAluguer -> nome

nome -> localização

idPontoAluguer -> localização (dependência funcional transitiva)












### 1ª Forma Normal (1NF)

ARTIGO (<ins>codigo</ins>, nome, cauçao, tempo limite)

CLIENTE (<ins>codigo</ins>, nCC, telemovel, email, primeiro nome, ultimo nome)

ALUGUER (<ins>id</ins>, data, entrega, #<ins>codigo</ins> -> ARTIGO, #<ins>id</ins> -> PONTO_DE_ALUGUER, #<ins>codigo</ins> -> CLIENTE)
 
PONTO_DE_ALUGUER (nome, <ins>id</ins>, codigoPostal, rua, porta, localidade)

FUNCIONARIO (<ins>id</ins>, nCC, primeiro nome, ultimo nome, endereço, salario, dn, #<ins>numero</ins> -> DEPARTAMENTO)

DEPARTAMENTO (<ins>numero</ins>, nome, codigoPostal, rua, porta, localidade, #<ins>id</ins> -> PONTO_DE_ALUGUER, #<ins>id</ins> -> FUNCIONARIO)

LINHA_ALUGUER ((#<ins>codigo</ins> -> ARTIGO, #<ins>idAluguer</ins> -> ALUGUER), quantidade)


### 2ª Forma Normal (2NF)

ARTIGO (<ins>codigo</ins>, nome, cauçao, tempo limite)

CLIENTE (<ins>codigo</ins>, nCC, telemovel, email, primeiro nome, ultimo nome)

ALUGUER (<ins>id</ins>, data, entrega, #<ins>codigo</ins>-> ARTIGO, #<ins>id</ins> -> PONTO_DE_ALUGUER, #<ins>codigo</ins> -> CLIENTE)
 
PONTO_DE_ALUGUER (nome, <ins>id</ins>, codigoPostal, rua, porta, localidade)

FUNCIONARIO (<ins>id</ins>, nCC, primeiro nome, ultimo nome, endereço, salario, dn, #<ins>numero</ins> -> DEPARTAMENTO)

DEPARTAMENTO (<ins>numero</ins>, nome, codigoPostal, rua, porta, localidade, #<ins>id</ins> -> PONTO_DE_ALUGUER, #<ins>id</ins> -> FUNCIONARIO)

DEPARTAMENTO_FUNCIONARIO ((#<ins>id</ins> -> FUNCIONARIO, #<ins>numero</ins> -> DEPARTAMENTO), cargo))

LINHA_ALUGUER ((#<ins>codigo</ins> -> ARTIGO, #<ins>id</ins> -> ALUGUER), quantidade)


### 3ª Forma Normal (3NF)


ARTIGO (<ins>codigo</ins>, nome, cauçao, tempo limite)

CLIENTE (<ins>codigo</ins>, nCC, telemovel, email, primeiro nome, ultimo nome)

ALUGUER (<ins>id</ins>, data, entrega, #<ins>codigo</ins> -> ARTIGO, #<ins>id</ins> -> PONTO_DE_ALUGUER, #<ins>codigo</ins> -> CLIENTE)
 
PONTO_DE_ALUGUER (nome, <ins>id</ins>, #codigoPostal -> CODIGOS_POSTAIS, rua, porta)

FUNCIONARIO (<ins>id</ins>, nCC, primeiro nome, ultimo nome, endereço, salario, dn, #<ins>numero</ins> -> DEPARTAMENTO)

DEPARTAMENTO (<ins>numero</ins>, nome, #codigo_postal -> CODIGOS_POSTAIS, rua, porta, #<ins>id</ins> -> PONTO_DE_ALUGUER, #<ins>id</ins> -> FUNCIONARIO)

DEPARTAMENTO_FUNCIONARIO ((#<ins>id</ins> -> FUNCIONARIO, #<ins>numero</ins> -> DEPARTAMENTO), cargo))

LINHA_ALUGUER ((#<ins>codigo</ins> -> ARTIGO, #<ins>id</ins> -> ALUGUER), quantidade)

CODIGOS_POSTAIS (<ins>codigo_postal</ins>, localidade)











### Forma Normal de Boyce-Codd (BCNF)

Não há alterações


### 4ª Forma Normal (4NF)

Não há alterações


---
[< Previous](rebd02.md) | [^ Main](https://github.com/tcm-sibd-g07/SIBD07/) | [Next >](rebd04.md)
:--- | :---: | ---: 
