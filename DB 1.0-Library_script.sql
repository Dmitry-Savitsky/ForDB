-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Library
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Library` ;

-- -----------------------------------------------------
-- Schema Library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Library` DEFAULT CHARACTER SET utf8 ;
USE `Library` ;

-- -----------------------------------------------------
-- Table `Library`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Library`.`Users` ;

CREATE TABLE IF NOT EXISTS `Library`.`Users` (
  `idUsers` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(100) NULL,
  `Login` VARCHAR(10) NULL,
  `Password` VARCHAR(15) NULL,
  `Role` TINYINT NULL,
  PRIMARY KEY (`idUsers`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idUsers_UNIQUE` ON `Library`.`Users` (`idUsers` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Library`.`Books`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Library`.`Books` ;

CREATE TABLE IF NOT EXISTS `Library`.`Books` (
  `idBooks` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NULL,
  `Author` VARCHAR(45) NULL,
  `Description` VARCHAR(255) NULL,
  `Count` INT NULL,
  `Categories` VARCHAR(120) NULL,
  PRIMARY KEY (`idBooks`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idBooks_UNIQUE` ON `Library`.`Books` (`idBooks` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Library`.`BookingBook`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Library`.`BookingBook` ;

CREATE TABLE IF NOT EXISTS `Library`.`BookingBook` (
  `idBookingBook` INT NOT NULL AUTO_INCREMENT,
  `BookingDate` DATE NULL,
  `Reserve` TINYINT NULL,
  `Users_idUsers` INT NOT NULL,
  `Books_idBooks` INT NOT NULL,
  PRIMARY KEY (`idBookingBook`),
  CONSTRAINT `fk_BookingBook_Users`
    FOREIGN KEY (`Users_idUsers`)
    REFERENCES `Library`.`Users` (`idUsers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BookingBook_Books1`
    FOREIGN KEY (`Books_idBooks`)
    REFERENCES `Library`.`Books` (`idBooks`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idBookingBook_UNIQUE` ON `Library`.`BookingBook` (`idBookingBook` ASC) VISIBLE;

CREATE INDEX `fk_BookingBook_Users_idx` ON `Library`.`BookingBook` (`Users_idUsers` ASC) VISIBLE;

CREATE INDEX `fk_BookingBook_Books1_idx` ON `Library`.`BookingBook` (`Books_idBooks` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
