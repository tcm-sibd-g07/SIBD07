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

USE `sibd07`;

INSERT INTO `cliente` (nCC, telemovel, email, primeiroNome, ultimoNome) VALUES ('10000001', '405877574', 'cliente01@gmail.com', 'Kaye', 'Farman'),
 ('10000002', '245316183', 'cliente02@gmail.com', 'Aubrey', 'Malster'),
 ('10000003', '564265113', 'cliente03@gmail.com', 'Chas', 'Brockhouse'),
 ('10000004', '315105348', 'cliente04@gmail.com', 'Gardy', 'Seale'),
 ('10000005', '712102973', 'cliente05@gmail.com', 'Rogerio', 'Shrubsall'),
 ('10000006', '853710430', 'cliente06@gmail.com', 'Cornell', 'Coddrington'),
 ('10000007', '585141035', 'cliente07@gmail.com', 'Felic', 'Gooddie'),
 ('10000008', '612796286', 'cliente08@gmail.com', 'Delbert', 'Sauvan'),
 ('10000009', '275588367', 'cliente09@gmail.com', 'Ernaline', 'Bothams'),
 ('10000010', '348275714', 'cliente10@gmail.com', 'Lindy', 'Moult'),
 ('10000011', '244154626', 'cliente11@gmail.com', 'Clem', 'Whitsun'),
 ('10000012', '594726514', 'cliente12@gmail.com', 'Hurley', 'Dugood'),
 ('10000013', '442549296', 'cliente13@gmail.com', 'Aggie', 'Boteman'),
 ('10000014', '128871120', 'cliente14@gmail.com', 'Hatty', 'Gladebeck'),
 ('10000015', '463252569', 'cliente15@gmail.com', 'Carmine', 'Crumbie'),
 ('10000016', '513153607', 'cliente16@gmail.com', 'Arliene', 'Drewe'),
 ('10000017', '413355217', 'cliente17@gmail.com', 'Nanice', 'Braddick'),
 ('10000018', '110679117', 'cliente18@gmail.com', 'Benito', 'Escalante'),
 ('10000019', '779778454', 'cliente19@gmail.com', 'Elizabet', 'Batalini'),
 ('10000020', '731815227', 'cliente20@gmail.com', 'Tome', 'D''Hooghe'),
 ('10000021', '797771844', 'cliente21@gmail.com', 'Abby', 'Inskipp'),
 ('10000022', '293447762', 'cliente22@gmail.com', 'Nissa', 'Ryder'),
 ('10000023', '729176497', 'cliente23@gmail.com', 'Nelson', 'Penk'),
 ('10000024', '185782483', 'cliente24@gmail.com', 'Chelsy', 'Mewrcik'),
 ('10000025', '963669549', 'cliente25@gmail.com', 'Carlen', 'Madigan'),
 ('10000026', '476718377', 'cliente26@gmail.com', 'Moe', 'Ertel'),
 ('10000027', '471540263', 'cliente27@gmail.com', 'Berton', 'Cartin'),
 ('10000028', '588129814', 'cliente28@gmail.com', 'Doyle', 'Amort'),
 ('10000029', '403144670', 'cliente29@gmail.com', 'Freedman', 'Mulcahy'),
 ('10000030', '176170686', 'cliente30@gmail.com', 'Rog', 'Washington');
 
INSERT INTO `artigo` (nome, caucao, tempoLimite) VALUES ('guarda sol', '10', '5'),
('baldes', '15', '6'),
('cadeiras', '15', '6'),
('raquetes', '15', '5'),
('barbatanas', '20', '2'),
('braçadeiras', '5', '4'),
('toalhas', '5', '8'),
('boia', '8', '4'),
('tenda', '50', '6'),
('chapéu', '5', '6'),
('bola', '5', '6'),
('mota de água', '150', '2'),
('prancha de surf', '70', '2');


INSERT INTO `codigos_postais` VALUES (codigopostal, localidade) (1, 'Gejiu'),
(2, 'Jiandou'),
(3, 'Agraharam'),
(4, 'Prince Albert'),
(5, 'Mingshan'),
(6, 'Qingzhou'),
(7, 'Yuzawa'),
(8, 'Gongnong'),
(9, 'Sirāhā'),
(10, 'Sterlitamak'),
(11, 'Aygeshat'),
(12, 'Hanchang'),
(13, 'Padova'),
(14, 'Raphoe'),
(15, 'Castanheiro do Sul'),
(16, 'Hushi'),
(17, 'Xiongzhang'),
(18, 'Al Mughayyir'),
(19, 'Tangdukou'),
(20, 'Tiyingtali Kelod'),
(21, 'Portão'),
(22, 'Taganak'),
(23, 'Bershet’'),
(24, 'Kumba'),
(25, 'Norashen'),
(26, 'Bejuco'),
(27, 'São Vicente de Ferreira'),
(28, 'Sing Buri'),
(29, 'Renhe'),
(30, 'Mem Martins');

INSERT INTO `ponto_de_aluguer` VALUES (nome, rua, porta, codigopostal) ('Shuangwang', 'Fairfield', 54, 1),
('Dębno', 'Havey', 68, 2),
('Tulu Bolo', 'Morning', 51, 3),
('Lansing', 'Green', 71, 4),
('Karanyowka', 'Menomonie', 90, 5),
('Ngembul', 'New Castle', 95, 6),
('Furudate', 'Shoshone', 97, 7),
('Paris 14', 'Browning', 20, 8),
('Podstepki', 'Oak', 67, 9),
('Pivovarikha', 'Westerfield', 98, 10),
('Fuzhai', 'Fulton', 94, 11),
('Puji', 'Arrowood', 43, 12),
('Detroit', 'Browning', 41, 13),
('Dongfeng', 'Manley', 100, 14),
('Tver', 'Darwin', 27, 15),
('Kochani', 'Green', 61, 16),
('Rantaupanjang', 'Meadow Ridge', 90, 17),
('Sharga', 'Artisan', 74, 18),
('Onsala', 'Pine View', 74, 19),
('Manturovo', 'Holy Cross', 83, 20),
('Vitarte', 'Glendale', 22, 21),
('Tapacocha', 'Brickson Park', 9, 22),
('Virginia', 'Redwing', 18, 23),
('Carriedo', 'Westend', 34, 24),
('Babao', 'Golf Course', 89, 25),
('Pau', 'Graedel', 73, 26),
('Bahía Honda', 'Fulton', 73, 27),
('Cijengkol', 'Maple Wood', 31, 28),
('Gal’bshtadt', 'Crowley', 48, 29),
('Hushi', 'Mallory', 30, 30);

INSERT INTO `aluguer` VALUES (data, codigoArtigo, idPontoAluguer, codigoCliente) ('2021-07-25', 1, 1, 1),
('2022-03-27', 2, 2, 2),
('2022-03-27', 3, 3, 3),
('2022-01-29', 4, 4, 4),
('2021-08-20', 5, 5, 5),
('2021-12-30', 6, 6, 6),
('2021-08-10', 7, 7, 7),
('2022-02-10', 8, 8, 8),
('2022-03-19', 9, 9, 9),
('2021-08-24', 10, 10, 10),
('2022-02-19', 11, 11, 11),
('2022-04-20', 12, 12, 12),
('2022-03-03', 13, 13, 13),
('2022-01-21', 1, 14, 14),
('2022-05-17', 2, 15, 15),
('2021-09-28', 3, 16, 16),
('2021-07-21', 4, 17, 17),
('2021-11-24', 5, 18, 18),
('2021-10-01', 6, 19, 19),
('2021-11-10', 7, 20, 20),
('2021-11-20', 8, 21, 21),
('2022-05-29', 9, 22, 22),
('2021-08-24', 10, 23, 23),
('2022-05-26', 11, 24, 24),
('2022-02-21', 12, 25, 25),
('2021-12-11', 13, 26, 26),
('2022-01-06', 1, 27, 27),
('2021-10-18', 2, 28, 28),
('2022-05-17', 3, 29, 29),
('2021-07-21', 4, 30, 30);

INSERT INTO `linha_aluguer` VALUES (codigoArtigoA, idAluguer, quantidade) values (1, 1, 7),
(2, 2, 8),
(3, 3, 10),
(4, 4, 3),
(5, 5, 10),
(6, 6, 10),
(7, 7, 10),
(8, 8, 4),
(9, 9, 6),
(10, 10, 7),
(11, 11, 8),
(12, 12, 2),
(13, 13, 6),
(1, 14, 9),
(2, 15, 2),
(3, 16, 3),
(4, 17, 9),
(5, 18, 6),
(6, 19, 5),
(7, 20, 7),
(8, 21, 3),
(9, 22, 5),
(10, 23, 7),
(11, 24, 1),
(12, 25, 3),
(13, 26, 1),
(1, 27, 6),
(2, 28, 4),
(3, 29, 3),
(4, 30, 9);




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
  
