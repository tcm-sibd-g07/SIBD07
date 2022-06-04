# C3 : Normalização

## Relações

## Conversão do Modelo EA para Modelo Relacional

### Passo 1: Entidades e Atributos

ARTIGO (_codigo, nome, localizaçao, cauçao, tempo limite)

CLIENTE (_codigo, n CC, telemovel, email, nome (primeiro, ultimo)

DEPARTAMENTO (_numero, nome, *localizaçao (cidade, rua, numero))

FUNCIONARIO (_id, n CC, nome (primeiro, ultimo), sexo, endereço, salario, dn)

ALUGUER (_idAluguer, data, entrega)

PONTO_DE_ALUGUER (nome, _id, localização (rua, cidade, numero))

### Passo 2: Associações 1:1

Não existem associações de cardinalidade 1:1

### Passo 3: Associações 1:N

ARTIGO (_codigo, nome, localizaçao, cauçao, tempo limite)

CLIENTE (_codigo, n CC, telemovel, email, nome (primeiro, ultimo)

ALUGUER (_idAluguer, data, entrega, #_codigo-> ARTIGO, #_id -> PONTO_DE_ALUGUER, #_codigo -> CLIENTE)
 
PONTO_DE_ALUGUER (nome, _id, localização (rua, cidade, numero))

DEPARTAMENTO (_numero, nome, *localizaçao (cidade, rua, numero), #_id -> PONTO_DE_ALUGUER)

### Passo 4: Associações N:M

DEPARTAMENTO (_numero, nome, *localizaçao (cidade, rua, numero), #_id -> PONTO_DE_ALUGUER, #_id -> FUNCIONARIO)

FUNCIONARIO (_id, n CC, nome (primeiro, ultimo), sexo, endereço, salario, dn, #_numero -> DEPARTAMENTO)

### Passo 5: Atributo Multivalor

Local(#_numero -> DEPARTAMENTO, localização)

DEPARTAMENTO (_numero, nome, #_id -> PONTO_DE_ALUGUER, #_id -> FUNCIONARIO) 

FUNCIONARIO (_id, n CC, nome (primeiro, ultimo), sexo, endereço, salario, dn, #_numero -> DEPARTAMENTO)

### Passo 6: Associação ternária

Não existem Asscociações Ternárias

### Passo 7: Entidades Fracas














## Normalização do Esquema Relacional
_(Apresentar o estudo da normalização das relações obtidas na secção anterior. Desnormalizar se necessário.)_

## Relacoes 


|Artigo|    |      |   |         |                   |
|-----------|----|------|---|---------|-------------------|
|_n.id      |nome|morada|nic|telefone*|#_parteDia -> Turno|

|Formacao     |            |    
|-------------|------------|
|_tipoFormacao|nomeFormacao|

|Turno    |    |                 |                    |
|---------|----|-----------------|--------------------|
|_parteDia|hora|#_gerencia->Turno|#_diaSemana->Horario|

|Horario   |       |          |      
|----------|-------|----------|
|_diaSemana|horaFim|horaInicio|

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
