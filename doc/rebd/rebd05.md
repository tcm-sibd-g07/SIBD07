## DDL

CREATE TABLE [dbo].[aluguer](

    [idAluguer] [int] NOT NULL,
    
    [dataInicial] [date] NOT NULL,
    
    [dataEntrega] [date] NOT NULL,
    
    [id_cliente] [int] NOT NULL,
    
    [id_pontoAluguer] [int] NOT NULL,
    
 CONSTRAINT [PK_aluguer] PRIMARY KEY CLUSTERED 
 
(

    [idAluguer] ASC
    
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON 

[PRIMARY]

) ON [PRIMARY]

GO

ALTER TABLE [dbo].[aluguer]  WITH CHECK ADD  CONSTRAINT [FK_aluguer_clientes] FOREIGN KEY([id_cliente])

REFERENCES [dbo].[clientes] ([codigoCliente])

GO

ALTER TABLE [dbo].[aluguer] CHECK CONSTRAINT [FK_aluguer_clientes]

GO

ALTER TABLE [dbo].[aluguer]  WITH CHECK ADD  CONSTRAINT [FK_aluguer_pontoAluguer] FOREIGN KEY([id_pontoAluguer])

REFERENCES [dbo].[pontoAluguer] ([idPontoAluguer])

GO

ALTER TABLE [dbo].[aluguer] CHECK CONSTRAINT [FK_aluguer_pontoAluguer]

GO

/** Object:  Table [dbo].[artigo]

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[artigo](

    [codigoArtigo] [int] NOT NULL,

    [nome] [varchar](100) NOT NULL,

    [caucao] [numeric](10, 2) NOT NULL,

    [tempoLimite] [datetime] NOT NULL,

CONSTRAINT [PK_artigo] PRIMARY KEY CLUSTERED 

(

[codigoArtigo] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON 

[PRIMARY]

) ON [PRIMARY]

GO

/** Object:  Table [dbo].[clientes]

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[clientes](

    [codigoCliente] [int] NOT NULL,
    
    [ncc] [bigint] NOT NULL,

    [telemovel] [bigint] NOT NULL,

    [email] [varchar](100) NOT NULL,

    [primeiroNome] [varchar](50) NOT NULL,

    [ultimoNome] [varchar](50) NOT NULL,

CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 

(

[codigoCliente] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON 

[PRIMARY]

) ON [PRIMARY]

GO

/** Object:  Table [dbo].[codPostais]  

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[codPostais](

    [codPostal] [int] NOT NULL,

    [localidade] [varchar](100) NULL,
    
CONSTRAINT [PK_codPostais] PRIMARY KEY CLUSTERED 

(

[codPostal] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON 

[PRIMARY]

) ON [PRIMARY]

GO

/** Object:  Table [dbo].[departamento]

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[departamento](

    [numeroDepar] [int] NOT NULL,

    [nome] [varchar](100) NOT NULL,

    [codPostal] [int] NOT NULL,

    [rua] [varchar](100) NOT NULL,

    [porta] [int] NOT NULL,

    [id_pontoAluguer] [int] NOT NULL,

CONSTRAINT [PK_departamento] PRIMARY KEY CLUSTERED 

(

[numeroDepar] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON 

[PRIMARY]

) ON [PRIMARY]

GO

ALTER TABLE [dbo].[departamento]  WITH CHECK ADD  CONSTRAINT [FK_departamento_codPostais] FOREIGN KEY([codPostal])

REFERENCES [dbo].[codPostais] ([codPostal])

GO

ALTER TABLE [dbo].[departamento] CHECK CONSTRAINT [FK_departamento_codPostais]

GO

ALTER TABLE [dbo].[departamento]  WITH CHECK ADD  CONSTRAINT [FK_departamento_pontoAluguer] FOREIGN KEY([id_pontoAluguer])

REFERENCES [dbo].[pontoAluguer] ([idPontoAluguer])

GO

ALTER TABLE [dbo].[departamento] CHECK CONSTRAINT [FK_departamento_pontoAluguer]

GO

/** Object:  Table [dbo].[funcionario] 

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[funcionario](

    [idFuncionario] [int] NOT NULL,

    [nCC] [bigint] NOT NULL,

    [primeiroNome] [varchar](50) NOT NULL,

    [ultimoNome] [varchar](50) NOT NULL,

    [salario] [numeric](10, 2) NOT NULL,

    [email] [varchar](100) NOT NULL,

    [dataNasc] [date] NOT NULL,

CONSTRAINT [PK_funcionario] PRIMARY KEY CLUSTERED 

(

[idFuncionario] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON 

[PRIMARY]

) ON [PRIMARY]

GO

/** Object:  Table [dbo].[funcionario_departamento]

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[funcionario_departamento](

    [idFuncionario] [int] NOT NULL,

    [idDepartamento] [int] NOT NULL,

    [cargo] [varchar](100) NOT NULL,

CONSTRAINT [PK_funcionario_departamento] PRIMARY KEY CLUSTERED 

(

[idFuncionario] ASC,

[idDepartamento] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON 

[PRIMARY]

) ON [PRIMARY]

GO

ALTER TABLE [dbo].[funcionario_departamento]  WITH CHECK ADD  CONSTRAINT [FK_funcionario_departamento_departamento] FOREIGN KEY([idDepartamento])

REFERENCES [dbo].[departamento] ([numeroDepar])

GO

ALTER TABLE [dbo].[funcionario_departamento] CHECK CONSTRAINT [FK_funcionario_departamento_departamento]

GO

ALTER TABLE [dbo].[funcionario_departamento]  WITH CHECK ADD  CONSTRAINT [FK_funcionario_departamento_funcionario] FOREIGN KEY([idFuncionario])

REFERENCES [dbo].[funcionario] ([idFuncionario])

GO

ALTER TABLE [dbo].[funcionario_departamento] CHECK CONSTRAINT [FK_funcionario_departamento_funcionario]

GO

/** Object:  Table [dbo].[linhaAluguer]  

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[linhaAluguer](

    [id_aluguer] [int] NOT NULL,

    [id_artigo] [int] NOT NULL,

    [quantidade] [int] NOT NULL,

CONSTRAINT [PK_linhaAluguer] PRIMARY KEY CLUSTERED 

(
    [id_aluguer] ASC,

[id_artigo] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON 

[PRIMARY]

) ON [PRIMARY]

GO

ALTER TABLE [dbo].[linhaAluguer]  WITH CHECK ADD  CONSTRAINT [FK_linhaAluguer_aluguer] FOREIGN KEY([id_aluguer])

REFERENCES [dbo].[aluguer] ([idAluguer])

GO

ALTER TABLE [dbo].[linhaAluguer] CHECK CONSTRAINT [FK_linhaAluguer_aluguer]

GO

ALTER TABLE [dbo].[linhaAluguer]  WITH CHECK ADD  CONSTRAINT [FK_linhaAluguer_artigo] FOREIGN KEY([id_artigo])

REFERENCES [dbo].[artigo] ([codigoArtigo])

GO

ALTER TABLE [dbo].[linhaAluguer] CHECK CONSTRAINT [FK_linhaAluguer_artigo]

GO

/** Object:  Table [dbo].[pontoAluguer]

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[pontoAluguer](

    [idPontoAluguer] [int] NOT NULL,

    [nome] [varchar](100) NOT NULL,

    [codPostal] [int] NOT NULL,

    [rua] [varchar](100) NOT NULL,

    [porta] [int] NOT NULL,

CONSTRAINT [PK_pontoAluguer] PRIMARY KEY CLUSTERED 

(

[idPontoAluguer] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON 

[PRIMARY]

) ON [PRIMARY]

GO

ALTER TABLE [dbo].[pontoAluguer]  WITH CHECK ADD  CONSTRAINT [FK_pontoAluguer_codPostais] FOREIGN KEY([codPostal])

REFERENCES [dbo].[codPostais] ([codPostal])

GO

ALTER TABLE [dbo].[pontoAluguer] CHECK CONSTRAINT [FK_pontoAluguer_codPostais]

GO


## DML

### Tabela Artigo

![An alternative description](images/TabelaArtigos.jpg)


#### Mencione os nomes dos artigos cuja caução é de 200.

SELECT nome

FROM Artigo

WHERE caução = 200;

#### Mencione todos os nomes dos artigos.

SELECT nome

FROM Artigo;

#### Mencione os artigos cuja caução seja inferior a 5.

SELECT nome

FROM Artigo

WHERE caução < 5;


---
[< Previous](rebd04.md) | [^ Main](https://github.com/tcm-sibd-g07/SIBD07/) | Next >
:--- | :---: | ---: 
  
