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

### Tabela Cliente

insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000001', '405877574', 'cliente01@gmail.com', 'Kaye', 'Farman');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000002', '245316183', 'cliente02@gmail.com', 'Aubrey', 'Malster');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000003', '564265113', 'cliente03@gmail.com', 'Chas', 'Brockhouse');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000004', '315105348', 'cliente04@gmail.com', 'Gardy', 'Seale');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000005', '712102973', 'cliente05@gmail.com', 'Rogerio', 'Shrubsall');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000006', '853710430', 'cliente06@gmail.com', 'Cornell', 'Coddrington');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000007', '585141035', 'cliente07@gmail.com', 'Felic', 'Gooddie');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000008', '612796286', 'cliente08@gmail.com', 'Delbert', 'Sauvan');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000009', '275588367', 'cliente09@gmail.com', 'Ernaline', 'Bothams');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000010', '348275714', 'cliente10@gmail.com', 'Lindy', 'Moult');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000011', '244154626', 'cliente11@gmail.com', 'Clem', 'Whitsun');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000012', '594726514', 'cliente12@gmail.com', 'Hurley', 'Dugood');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000013', '442549296', 'cliente13@gmail.com', 'Aggie', 'Boteman');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000014', '128871120', 'cliente14@gmail.com', 'Hatty', 'Gladebeck');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000015', '463252569', 'cliente15@gmail.com', 'Carmine', 'Crumbie');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000016', '513153607', 'cliente16@gmail.com', 'Arliene', 'Drewe');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000017', '413355217', 'cliente17@gmail.com', 'Nanice', 'Braddick');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000018', '110679117', 'cliente18@gmail.com', 'Benito', 'Escalante');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000019', '779778454', 'cliente19@gmail.com', 'Elizabet', 'Batalini');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000020', '731815227', 'cliente20@gmail.com', 'Tome', 'D''Hooghe');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000021', '797771844', 'cliente21@gmail.com', 'Abby', 'Inskipp');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000022', '293447762', 'cliente22@gmail.com', 'Nissa', 'Ryder');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000023', '729176497', 'cliente23@gmail.com', 'Nelson', 'Penk');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000024', '185782483', 'cliente24@gmail.com', 'Chelsy', 'Mewrcik');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000025', '963669549', 'cliente25@gmail.com', 'Carlen', 'Madigan');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000026', '476718377', 'cliente26@gmail.com', 'Moe', 'Ertel');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000027', '471540263', 'cliente27@gmail.com', 'Berton', 'Cartin');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000028', '588129814', 'cliente28@gmail.com', 'Doyle', 'Amort');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000029', '403144670', 'cliente29@gmail.com', 'Freedman', 'Mulcahy');
insert into cliente (nCC, telemovel, email, primeiroNome, ultimoNome) values ('10000030', '176170686', 'cliente30@gmail.com', 'Rog', 'Washington');


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
  
