# C3 : Esquema conceptual

## Modelo E/A
**Entidades:**

DEPARTAMENTO (nome, numero, localização (cidade, rua, numero))

EMPREGADO (nome (primeiro e último), ID, número CC, endereço, salário, sexo, data de nascimento) 
GERENTE (nome (primeiro e último), número CC, endereço, sexo, data de nascimento)
ARTIGO (nome, código localização unica, hora lim, val caução)
CLIENTE (nome (primeiro e último), número CC, email e telefone)

**Associações:**
trabalhaPara (EMPREGADO, DEPARTAMENTO) N:M
fazReposição (EMPREGADO, ARTIGO) N:M
gerencia (GERENTE, ARTIGO) 1:N
controla (GERENTE, DEPARTAMENTO) 1:1
aluga (CLIENTE, ARTIGO) N:M





Exemplo de inserção de uma imagem:   
![An alternative description](images/image02.png)   

Always add a description to help the user understand the figure 

NOTA: Cada entidade-tipo e cada associação devem ter um pequeno texto – um ou dois parágrafos – para descrever esse elemento do modelo e os seus atributos)

## Regras de negócio adicionais (Restrições)
_(Apresentar uma lista detalhada das regras e restrições não possíveis de representar no modelo E/A, que visam a manutenção da consistência e integridade da modelação do problema)_

---
[< Previous](rei02.md) | [^ Main](https://github.com/exemploTrabalho/reportSIBD/) | Next >
:--- | :---: | ---: 
