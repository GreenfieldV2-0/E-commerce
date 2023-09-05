-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema commerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema commerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `commerce` DEFAULT CHARACTER SET utf8 ;
USE `commerce` ;

-- -----------------------------------------------------
-- Table `commerce`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `commerce`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`iduser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `commerce`.`panier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `commerce`.`panier` (
  `idpanier` INT NOT NULL AUTO_INCREMENT,
  `user_iduser` INT NOT NULL,
  PRIMARY KEY (`idpanier`, `user_iduser`),
  INDEX `fk_panier_user_idx` (`user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_panier_user`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `commerce`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `commerce`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `commerce`.`admin` (
  `idadmin` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idadmin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `commerce`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `commerce`.`products` (
  `idproducts` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `price` VARCHAR(255) NOT NULL,
  `category` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `image` VARCHAR(455) NOT NULL,
  `panier_idpanier` INT NOT NULL,
  `panier_user_iduser` INT NOT NULL,
  `admin_idadmin` INT NOT NULL,
  PRIMARY KEY (`idproducts`, `panier_idpanier`, `panier_user_iduser`, `admin_idadmin`),
  INDEX `fk_products_panier1_idx` (`panier_idpanier` ASC, `panier_user_iduser` ASC) VISIBLE,
  INDEX `fk_products_admin1_idx` (`admin_idadmin` ASC) VISIBLE,
  CONSTRAINT `fk_products_panier1`
    FOREIGN KEY (`panier_idpanier` , `panier_user_iduser`)
    REFERENCES `commerce`.`panier` (`idpanier` , `user_iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_admin1`
    FOREIGN KEY (`admin_idadmin`)
    REFERENCES `commerce`.`admin` (`idadmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
