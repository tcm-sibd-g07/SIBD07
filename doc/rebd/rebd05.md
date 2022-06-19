## DDL

CREATE SCHEMA IF NOT EXISTS `sibd07` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `sibd07` ;

-- -----------------------------------------------------
-- Table `sibd07`.`artigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sibd07`.`artigo` (

  `codigo` INT NOT NULL AUTO_INCREMENT,
  
  `nome` VARCHAR(100) NOT NULL,
  
  `caucao` DECIMAL(10,2) NULL DEFAULT NULL,
  
  `tempoLimite` INT NULL DEFAULT NULL,
 
 PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sibd07`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sibd07`.`cliente` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nCC` INT NOT NULL,
  `telemovel` INT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `primeiroNome` VARCHAR(100) NOT NULL,
  `ultimoNome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sibd07`.`códigos postais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sibd07`.`códigos postais` (
  `codigo postal` INT NOT NULL,
  `localidade` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo postal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sibd07`.`ponto de aluguer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sibd07`.`ponto de aluguer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `rua` VARCHAR(100) NOT NULL,
  `porta` INT NOT NULL,
  `codigopostal` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `codigopostal_idx` (`codigopostal` ASC) VISIBLE,
  CONSTRAINT `codigopostal`
    FOREIGN KEY (`codigopostal`)
    REFERENCES `sibd07`.`códigos postais` (`codigo postal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sibd07`.`aluguer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sibd07`.`aluguer` (
  `idAluguer` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `entrega` VARCHAR(45) NOT NULL,
  `codigoArtigo` INT NOT NULL,
  `idPontoAluguer` INT NOT NULL,
  `codigoCliente` INT NOT NULL,
  PRIMARY KEY (`idAluguer`),
  INDEX `codigoArtigo_idx` (`codigoArtigo` ASC) VISIBLE,
  INDEX `idPontoAluguer_idx` (`idPontoAluguer` ASC) VISIBLE,
  INDEX `codigoCliente_idx` (`codigoCliente` ASC) VISIBLE,
  CONSTRAINT `codigoArtigo`
    FOREIGN KEY (`codigoArtigo`)
    REFERENCES `sibd07`.`artigo` (`codigo`),
  CONSTRAINT `codigoCliente`
    FOREIGN KEY (`codigoCliente`)
    REFERENCES `sibd07`.`cliente` (`codigo`),
  CONSTRAINT `idPontoAluguer`
    FOREIGN KEY (`idPontoAluguer`)
    REFERENCES `sibd07`.`ponto de aluguer` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sibd07`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sibd07`.`funcionario` (
  `id` INT NOT NULL,
  `nCC` BIGINT NOT NULL,
  `primeiroNome` VARCHAR(50) NOT NULL,
  `ultimoNome` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `salario` DECIMAL(10,2) NOT NULL,
  `dn` DATE NOT NULL,
  `numeroD` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `numeroD_idx` (`numeroD` ASC) VISIBLE,
  CONSTRAINT `numeroD`
    FOREIGN KEY (`numeroD`)
    REFERENCES `sibd07`.`departamento` (`numeroD`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sibd07`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sibd07`.`departamento` (
  `numeroD` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `codigoPostalD` INT NOT NULL,
  `rua` VARCHAR(100) NOT NULL,
  `porta` INT NOT NULL,
  `idPontoAluguerD` INT NOT NULL,
  `idFuncionario` INT NOT NULL,
  PRIMARY KEY (`numeroD`),
  INDEX `codigoPostal_idx` (`codigoPostalD` ASC) VISIBLE,
  INDEX `idPontoAluguer_idx` (`idPontoAluguerD` ASC) VISIBLE,
  INDEX `idFuncionario_idx` (`idFuncionario` ASC) VISIBLE,
  CONSTRAINT `codigoPostalD`
    FOREIGN KEY (`codigoPostalD`)
    REFERENCES `sibd07`.`códigos postais` (`codigo postal`),
  CONSTRAINT `idFuncionario`
    FOREIGN KEY (`idFuncionario`)
    REFERENCES `sibd07`.`funcionario` (`id`),
  CONSTRAINT `idPontoAluguerD`
    FOREIGN KEY (`idPontoAluguerD`)
    REFERENCES `sibd07`.`ponto de aluguer` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sibd07`.`departamento_funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sibd07`.`departamento_funcionario` (
  `idFuncionarioF` INT NOT NULL,
  `numeroDD` INT NOT NULL,
  `cargo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idFuncionarioF`, `numeroDD`),
  INDEX `numeroD_idx` (`numeroDD` ASC) VISIBLE,
  CONSTRAINT `idFuncionarioF`
    FOREIGN KEY (`idFuncionarioF`)
    REFERENCES `sibd07`.`funcionario` (`id`),
  CONSTRAINT `numeroDD`
    FOREIGN KEY (`numeroDD`)
    REFERENCES `sibd07`.`departamento` (`numeroD`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sibd07`.`linha aluguer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sibd07`.`linha aluguer` (
  `codigoArtigoA` INT NOT NULL,
  `idAluguer` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`codigoArtigoA`, `idAluguer`),
  INDEX `idAluguer_idx` (`idAluguer` ASC) VISIBLE,
  CONSTRAINT `codigoArtigoA`
    FOREIGN KEY (`codigoArtigoA`)
    REFERENCES `sibd07`.`artigo` (`codigo`),
  CONSTRAINT `idAluguer`
    FOREIGN KEY (`idAluguer`)
    REFERENCES `sibd07`.`aluguer` (`idAluguer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


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
  
