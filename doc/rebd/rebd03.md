# C3 : Normalização

## Relações

## Conversão do Modelo EA para Modelo Relacional

### Passo 1: Entidades e Atributos

ARTIGO (_codigo, nome, cauçao, tempo limite)

CLIENTE (_codigo, nCC, telemovel, email, nome (primeiro, ultimo)

DEPARTAMENTO (_numero, nome, *localizaçao (codigoPostal, rua, porta, localidade))

FUNCIONARIO (_id, nCC, nome (primeiro, ultimo), endereço, salario, dn)

ALUGUER (_id, data, entrega)

PONTO_DE_ALUGUER (nome, _id, localização (codigoPostal, rua, porta, localidade))


### Passo 2: Associações 1:1 

Nao existem ligações 1:1


### Passo 3: Associações 1:N  

ARTIGO (_codigo, nome, cauçao, tempo limite)

CLIENTE (_codigo, nCC, telemovel, email, nome (primeiro, ultimo))

ALUGUER (_id, data, entrega, #_codigo-> ARTIGO, #_id -> PONTO_DE_ALUGUER, #_codigo -> CLIENTE)
 
PONTO_DE_ALUGUER (nome, _id, localização (codigoPostal, rua, porta, localidade))

DEPARTAMENTO (_numero, nome, *localizaçao (codigoPostal, rua, porta, localidade), #_id -> PONTO_DE_ALUGUER)


### Passo 4: Associações N:M

DEPARTAMENTO_FUNCIONARIO (_(#id, #numero), cargo))

LINHA_ALUGUER (_(#codigo -> ARTIGO, #id -> ALUGUER), quantidade)
















## Normalização do Esquema Relacional
_(Apresentar o estudo da normalização das relações obtidas na secção anterior. Desnormalizar se necessário.)_

### 1ª Forma Normal (1NF)

ARTIGO (_codigo, nome, cauçao, tempo limite)

CLIENTE (_codigo, nCC, telemovel, email, primeiro nome, ultimo nome)

ALUGUER (_id, data, entrega, #_codigo-> ARTIGO, #_id -> PONTO_DE_ALUGUER, #_codigo -> CLIENTE)
 
PONTO_DE_ALUGUER (nome, _id, codigoPostal, rua, porta, localidade)

FUNCIONARIO (_id, nCC, primeiro nome, ultimo nome, endereço, salario, dn, #_numero -> DEPARTAMENTO)

DEPARTAMENTO (_numero, nome, codigoPostal, rua, porta, localidade, #_id -> PONTO_DE_ALUGUER, #_id -> FUNCIONARIO)

LINHA_ALUGUER (_(#codigo -> ARTIGO, #idAluguer -> ALUGUER), quantidade)


### 2ª Forma Normal (2NF)

ARTIGO (_codigo, nome, cauçao, tempo limite)

CLIENTE (_codigo, nCC, telemovel, email, primeiro nome, ultimo nome)

ALUGUER (_id, data, entrega, #_codigo-> ARTIGO, #_id -> PONTO_DE_ALUGUER, #_codigo -> CLIENTE)
 
PONTO_DE_ALUGUER (nome, _id, codigoPostal, rua, porta, localidade)

FUNCIONARIO (_id, nCC, primeiro nome, ultimo nome, endereço, salario, dn, #_numero -> DEPARTAMENTO)

DEPARTAMENTO (_numero, nome, codigoPostal, rua, porta, localidade, #_id -> PONTO_DE_ALUGUER, #_id -> FUNCIONARIO)

DEPARTAMENTO_FUNCIONARIO (_(#id, #numero), cargo))

LINHA_ALUGUER (_(#codigo -> ARTIGO, #id -> ALUGUER), quantidade)


### 3ª Forma Normal (3NF)


ARTIGO (_codigo, nome, cauçao, tempo limite)

CLIENTE (_codigo, nCC, telemovel, email, primeiro nome, ultimo nome)

ALUGUER (_id, data, entrega, #_codigo-> ARTIGO, #_id -> PONTO_DE_ALUGUER, #_codigo -> CLIENTE)
 
PONTO_DE_ALUGUER (nome, _id, #codigoPostal -> CODIGOS_POSTAIS, rua, porta)

FUNCIONARIO (_id, nCC, primeiro nome, ultimo nome, endereço, salario, dn, #_numero -> DEPARTAMENTO)

DEPARTAMENTO (_numero, nome, #codigo_postal -> CODIGOS_POSTAIS, rua, porta, #_id -> PONTO_DE_ALUGUER, #_id -> FUNCIONARIO)

DEPARTAMENTO_FUNCIONARIO (_(#id, #numero), cargo))

LINHA_ALUGUER (_(#codigo -> ARTIGO, #id -> ALUGUER), quantidade)

CODIGOS_POSTAIS (_codigo_postal, localidade)







### Forma Normal de Boyce-Codd (BCNF)

Não há alterações


### 4ª Forma Normal (4NF)

Não há alterações




## Relacoes 


|Artigo|    |      |      |         |
|-----------|------|------|---------|
|_Código|nome|caução|tempolimite|

|Cliente     |            |             |            |            |            |
|-------------|------------|------------|------------|------------|------------|
|_Código|ncc|telemóvel|email|primeironome|ultimonome|

|Aluguer    |    |                 |                    |                  |                    |
|---------|----|-----------------|--------------------|--------------------|--------------------|
|_id|data|entrega|#_código->Artigo|#_id->Ponto_de_Aluguer|#_código->Cliente|

|Ponto_De_Aluguer  |       |          |  |          |       
|----------|-------|----------|----------|----------|
|_id|nome|rua|porta|#_códigopostal->Código_Postais|

|Seccao   |         |          |         |                        |           |
|---------|---------|----------|---------|------------------------|-----------|
|_gerencia|cosmetico|fornecedor|reposicao|caixa|perfumaria|limpeza|maquilhagem|

|Fornecedor|    |         |         |
|----------|----|---------|---------|
|_id       |nome|tipoStock|telefone*|


|Produto|    |           |        |
|-------|----|-----------|--------|
|_codigo|nome|tipoProduto|validade|

|Entrega     |        |       |          |                |
|------------|--------|-------|----------|----------------|
|_tipoProduto|validade|reserva|quantidade|#_id->Fornecedor|


|PrecisaDe          |                        |
|-------------------|------------------------|
|#_n.id->Funcionario|#_tipoFormacao->Formacao|

|Envia                 |                 |        
|----------------------|-----------------|
|#_tipoProduto->Entrega|#_codigo->Produto|

|Contacto           |                 |        |
|-------------------|-----------------|--------|
|#_n.id->Funcionario|#_codigo->Produto|telefone|

|Tem             |                  |                     |             
|----------------|------------------|---------------------|
|#_id->Fornecedor|#_gerencia->Seccao|#p_diaSemana->Horario|

---
[< Previous](rebd02.md) | [^ Main](https://github.com/tcm-sibd-g07/SIBD07/) | [Next >](rebd04.md)
:--- | :---: | ---: 
