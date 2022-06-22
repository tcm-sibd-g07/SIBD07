CREATE SCHEMA IF NOT EXISTS `sibd07` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `sibd07` ;

-- -----------------------------------------------------
-- Table `sibd07`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sibd07`.`cliente` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nCC` BIGINT NOT NULL,
  `telemovel` BIGINT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `primeiroNome` VARCHAR(100) NOT NULL,
  `ultimoNome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sibd07`.`codigos_postais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sibd07`.`codigos_postais` (
  `codigopostal` INT NOT NULL,
  `localidade` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigopostal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sibd07`.`ponto_de_aluguer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sibd07`.`ponto_de_aluguer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `rua` VARCHAR(100) NOT NULL,
  `porta` INT NOT NULL,
  `codigopostal` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `codigopostal_idx` (`codigopostal` ASC) VISIBLE,
  CONSTRAINT `codigopostal`
    FOREIGN KEY (`codigopostal`)
    REFERENCES `sibd07`.`codigos_postais` (`codigopostal`))
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sibd07`.`aluguer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sibd07`.`aluguer` (
  `idAluguer` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `idPontoAluguer` INT NOT NULL,
  `codigoCliente` INT NOT NULL,
  PRIMARY KEY (`idAluguer`),
  INDEX `idPontoAluguer_idx` (`idPontoAluguer` ASC) VISIBLE,
  INDEX `codigoCliente_idx` (`codigoCliente` ASC) VISIBLE,
  CONSTRAINT `codigoCliente`
    FOREIGN KEY (`codigoCliente`)
    REFERENCES `sibd07`.`cliente` (`codigo`),
  CONSTRAINT `idPontoAluguer`
    FOREIGN KEY (`idPontoAluguer`)
    REFERENCES `sibd07`.`ponto_de_aluguer` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 30
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
AUTO_INCREMENT = 14
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
  PRIMARY KEY (`numeroD`),
  INDEX `codigoPostal_idx` (`codigoPostalD` ASC) VISIBLE,
  INDEX `idPontoAluguer_idx` (`idPontoAluguerD` ASC) VISIBLE,
  CONSTRAINT `codigoPostalD`
    FOREIGN KEY (`codigoPostalD`)
    REFERENCES `sibd07`.`codigos_postais` (`codigopostal`),
  CONSTRAINT `idPontoAluguerD`
    FOREIGN KEY (`idPontoAluguerD`)
    REFERENCES `sibd07`.`ponto_de_aluguer` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 32
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
  PRIMARY KEY (`id`))
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
-- Table `sibd07`.`linha_aluguer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sibd07`.`linha_aluguer` (
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
