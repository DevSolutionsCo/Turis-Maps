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
CREATE SCHEMA IF NOT EXISTS `turismaps` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;
USE `turismaps` ;

-- -----------------------------------------------------
-- Table `turismaps`.`lugar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismaps`.`lugar` (
  `id_lugar` INT NOT NULL,
  `nombre_lugar` VARCHAR(40) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`id_lugar`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;



-- -----------------------------------------------------
-- Table `turismaps`.`turista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismaps`.`turista` (
  `id_turista` INT NOT NULL AUTO_INCREMENT,
  `correo` VARCHAR(30) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nombre` VARCHAR(40) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `apellido_pat` VARCHAR(40) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `apellido_mat` VARCHAR(40) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `fecha_nac` DATE NULL DEFAULT NULL,
  `lugar_proc` VARCHAR(30) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `genero` VARCHAR(10) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `contrasena` VARCHAR(20) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nombre_user` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`id_turista`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `turismaps`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismaps`.`comentarios` (
  `id_comentario` INT NOT NULL AUTO_INCREMENT,
  `comentario` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `calificacion` INT NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `id_turista` INT NULL DEFAULT NULL,
  `id_lugar` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  INDEX `id_lugar` (`id_lugar` ASC) VISIBLE,
  INDEX `id_turista` (`id_turista` ASC) VISIBLE,
  CONSTRAINT `comentarios_ibfk_1`
    FOREIGN KEY (`id_lugar`)
    REFERENCES `turismaps`.`lugar` (`id_lugar`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `comentarios_ibfk_2`
    FOREIGN KEY (`id_turista`)
    REFERENCES `turismaps`.`turista` (`id_turista`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `turismaps`.`lugar_comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismaps`.`lugar_comentarios` (
  `id_comentario` INT NULL DEFAULT NULL,
  `id_lugar` INT NULL DEFAULT NULL,
  INDEX `id_comentario` (`id_comentario` ASC) VISIBLE,
  INDEX `id_lugar` (`id_lugar` ASC) VISIBLE,
  CONSTRAINT `lugar_comentarios_ibfk_1`
    FOREIGN KEY (`id_comentario`)
    REFERENCES `turismaps`.`comentarios` (`id_comentario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `lugar_comentarios_ibfk_2`
    FOREIGN KEY (`id_lugar`)
    REFERENCES `turismaps`.`lugar` (`id_lugar`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `turismaps`.`turista_comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismaps`.`turista_comentarios` (
  `id_comentario` INT NULL DEFAULT NULL,
  `id_turista` INT NULL DEFAULT NULL,
  INDEX `id_comentario` (`id_comentario` ASC) VISIBLE,
  INDEX `id_turista` (`id_turista` ASC) VISIBLE,
  CONSTRAINT `turista_comentarios_ibfk_1`
    FOREIGN KEY (`id_comentario`)
    REFERENCES `turismaps`.`comentarios` (`id_comentario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `turista_comentarios_ibfk_2`
    FOREIGN KEY (`id_turista`)
    REFERENCES `turismaps`.`turista` (`id_turista`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;

insert into lugar (id_lugar, nombre_lugar) values
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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
