-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema turismaps
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema turismaps
-- -----------------------------------------------------
DROP DATABASE IF NOT EXISTS `turismaps`
CREATE SCHEMA IF NOT EXISTS `turismaps` DEFAULT CHARACTER SET utf8 ;
USE `turismaps` ;

-- -----------------------------------------------------
-- Table `turismaps`.`lugar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismaps`.`LUGAR` (
  `ID_LUGAR` INT NOT NULL,
  `NOMBRE_LUGAR` VARCHAR(40) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`ID_LUGAR`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

insert into LUGAR (ID_LUGAR, NOMBRE_LUGAR) values
(1, "Museo Frida Coyoacan"),
(2, "Mercado Coyoacan"),
(3, "Viveros Coyoacan"),
(4, "Jardin Centenario Coyoacan"),
(5, "museo de culturas populares"),
(6, "castillo de chapultepec"),
(7, "parque bicentenario"),
(8, "auditorio nacional"),
(9, "museo de antropologia"),
(10, "batiz"),
(11, "plaza 3 culturas"),
(12, "plaza de la constitucion"),
(13, "monumento a la revolucion"),
(14, "Bellas artes"),
(15, "angel de la independencia"),
(16, "Parque la mexicana"),
(17, "pasaje del shiro"),
(18, "club de golf"),
(19, "Exconvento"),
(20, "Valle de las monjas"),
(21, "Parque hundido"),
(22, "cineteca nacional"),
(23, "World Trade Center"),
(24, "monumental plaza de toros"),
(25, "Estadio Ciudad de los Deportes"),
(26, "Isla de las munecas"),
(27, "Las trajineras"),
(28, "Mercado de plantas Xochi"),
(29, "parque ecologico de Xochimilco"),
(30, "Museo arqueologico de xochimilco"),
(31, "Parque Tezozomoc"),
(32, "Casa de cultura"),
(33, "arena CDMX"),
(34, "Centro Verde Azcapotzalco"),
(35, "Alameda Norte"),
(36, "Estadio Alfredo"),
(37, "foro sol"),
(38, "Alameda Central"),
(39, "Autodromo Hermanos Rodriguez"),
(40, "Palacio de los deportes");


-- -----------------------------------------------------
-- Table `turismaps`.`turista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismaps`.`TURISTA` (
  `ID_TURISTA` INT NOT NULL AUTO_INCREMENT,
  `CORREO` VARCHAR(30) CHARACTER SET 'utf8'  NULL DEFAULT NULL,
  `NOMBRE` VARCHAR(40) CHARACTER SET 'utf8'  NULL DEFAULT NULL,
  `APELLIDO_PAT` VARCHAR(40) CHARACTER SET 'utf8'  NULL DEFAULT NULL,
  `APELLIDO_MAT` VARCHAR(40) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `FECHA_NAC` DATE NULL DEFAULT NULL,
  `LUGAR_PROC` VARCHAR(30) CHARACTER SET 'utf8'  NULL DEFAULT NULL,
  `GENERO` VARCHAR(10) CHARACTER SET 'utf8'  NULL DEFAULT NULL,
  `CONTRASENA` VARCHAR(20) CHARACTER SET 'utf8'  NULL DEFAULT NULL,
  `NOMBRE_USER` VARCHAR(45) CHARACTER SET 'utf8'  NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TURISTA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `turismaps`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismaps`.`COMENTARIOS` (
  `ID_COMENTARIO` INT NOT NULL AUTO_INCREMENT,
  `COMENTARIO` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `CALIFICACION` INT NULL DEFAULT NULL,
  `FECHA` DATE NULL DEFAULT NULL,
  `ID_TURISTA` INT NULL DEFAULT NULL,
  `ID_LUGAR` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID_COMENTARIO`),
  INDEX `ID_LUGAR` (`ID_LUGAR` ASC),
  INDEX `ID_TURISTA` (`ID_TURISTA` ASC),
  CONSTRAINT `comentarios_ibfk_1`
    FOREIGN KEY (`ID_LUGAR`)
    REFERENCES `turismaps`.`lugar` (`ID_LUGAR`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `comentarios_ibfk_2`
    FOREIGN KEY (`ID_TURISTA`)
    REFERENCES `turismaps`.`turista` (`ID_TURISTA`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `turismaps`.`lugar_comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismaps`.`LUGAR_COMENTARIOS` (
  `ID_COMENTARIO` INT NULL DEFAULT NULL,
  `ID_LUGAR` INT NULL DEFAULT NULL,
  INDEX `ID_COMENTARIO` (`ID_COMENTARIO` ASC),
  INDEX `ID_LUGAR` (`ID_LUGAR` ASC),
  CONSTRAINT `lugar_comentarios_ibfk_1`
    FOREIGN KEY (`ID_COMENTARIO`)
    REFERENCES `turismaps`.`comentarios` (`ID_COMENTARIO`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `lugar_comentarios_ibfk_2`
    FOREIGN KEY (`ID_LUGAR`)
    REFERENCES `turismaps`.`lugar` (`ID_LUGAR`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `turismaps`.`turista_comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismaps`.`TURISTA_COMENTARIOS` (
  `ID_COMENTARIO` INT NULL DEFAULT NULL,
  `ID_TURISTA` INT NULL DEFAULT NULL,
  INDEX `ID_COMENTARIO` (`ID_COMENTARIO` ASC),
  INDEX `ID_TURISTA` (`ID_TURISTA` ASC),
  CONSTRAINT `turista_comentarios_ibfk_1`
    FOREIGN KEY (`ID_COMENTARIO`)
    REFERENCES `turismaps`.`comentarios` (`ID_COMENTARIO`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `turista_comentarios_ibfk_2`
    FOREIGN KEY (`ID_TURISTA`)
    REFERENCES `turismaps`.`turista` (`ID_TURISTA`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
