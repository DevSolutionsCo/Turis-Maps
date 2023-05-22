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
CREATE SCHEMA IF NOT EXISTS `turismaps` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `turismaps` ;

-- -----------------------------------------------------
-- Table `turismaps`.`lugar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismaps`.`lugar` (
  `id_lugar` INT NOT NULL,
  `nombre_lugar` VARCHAR(40) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  PRIMARY KEY (`id_lugar`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `turismaps`.`turista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismaps`.`turista` (
  `id_turista` INT NOT NULL AUTO_INCREMENT,
  `correo` VARCHAR(30) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `nombre` VARCHAR(40) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `apellido_pat` VARCHAR(40) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `apellido_mat` VARCHAR(40) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `fecha_nac` DATE NULL DEFAULT NULL,
  `lugar_proc` VARCHAR(30) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `genero` VARCHAR(10) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `contrasena` VARCHAR(20) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `nombre_user` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  PRIMARY KEY (`id_turista`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `turismaps`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismaps`.`comentarios` (
  `id_comentario` INT NOT NULL AUTO_INCREMENT,
  `comentario` VARCHAR(100) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
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
COLLATE = utf8mb4_0900_ai_ci;


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
COLLATE = utf8mb4_0900_ai_ci;


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
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
