# C2 : Esquema conceptual

## Modelo E/A

### Entidades:

ARTIGO (<ins>codigo</ins>, nome, cauçao, tempo limite)

CLIENTE (_codigo, nCC, telemovel, email, nome (primeiro, ultimo)

DEPARTAMENTO (_numero, nome, *localizaçao (codigoPostal, rua, porta, localidade))

FUNCIONARIO (_id, nCC, nome (primeiro, ultimo), endereço, salario, dn)

ALUGUER (_id, data, entrega)

PONTO_DE_ALUGUER (nome, _id, localização (codigoPostal, rua, porta, localidade))


### Associações:

trabalhaPara (FUNCIONARIO, DEPARTAMENTO) N:M  P/T

efetua (CLIENTE, ALUGUER) 1:N  P/P

paraObter (ALUGUER, ARTIGO) M:N  P/T

faz (PONTO_DE_ALUGUER, ALUGUER) 1:N  P/P

éGerido (PONTO_DE_ALUGUER, DEPARTAMENTO) 1:N  P/T






Diagrama E/A 
![An alternative description](images/DiagramaOriginal.jpeg)

## Regras de negócio adicionais (Restrições)
Alguns dos artigos não tem qualquer caução ou limite de horas de aluguer.

O gerente deve fazer uma análise mensalmente relativamente aos alugueres efetuados no respetivo mês. 


---
[< Previous](rebd01.md) | [^ Main](https://github.com/tcm-sibd-g07/SIBD07/) | [Next >](rebd03.md)
:--- | :---: | ---: 
