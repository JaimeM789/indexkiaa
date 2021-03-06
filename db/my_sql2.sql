-- MySQL Script generated by MySQL Workbench
-- Thu Apr 22 17:49:23 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Organizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Organizacion` (
  `id_org` INT NOT NULL AUTO_INCREMENT,
  `Nombre_org` VARCHAR(25) CHARACTER SET 'utf8' NOT NULL,
  `tipo_org` ENUM('detalle1', 'detalle2', 'detalle3', 'detalle4') NOT NULL,
  PRIMARY KEY (`id_org`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre_usuario` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `correo_usuario` VARCHAR(25) CHARACTER SET 'utf8' NOT NULL,
  `password_usuario` VARCHAR(20) CHARACTER SET 'utf8' NOT NULL,
  `rol_usuario` ENUM('user', 'admin', 'docente') CHARACTER SET 'utf8' NOT NULL,
  `docente_usuario` INT NOT NULL,
  `id_org` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `_idx` (`id_org` ASC) VISIBLE,
  CONSTRAINT `usuarios`
    FOREIGN KEY (`id_org`)
    REFERENCES `mydb`.`Organizacion` (`id_org`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sesion_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sesion_usuario` (
  `id_Sesion_usuario` INT NOT NULL AUTO_INCREMENT,
  `Turnos_usuario` INT NOT NULL,
  `Lab_usuario` ENUM('lab1', 'lab2', 'lab3', 'lab4') NOT NULL,
  `id_usuario` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `Usuarios_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_Sesion_usuario`),
  INDEX `fk_Sesion_usuario_Usuarios1_idx` (`Usuarios_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Sesion_usuario_Usuarios1`
    FOREIGN KEY (`Usuarios_id_usuario`)
    REFERENCES `mydb`.`Usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
