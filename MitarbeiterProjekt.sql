-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mitarbeiterprj
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mitarbeiterprj` ;

-- -----------------------------------------------------
-- Schema mitarbeiterprj
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mitarbeiterprj` DEFAULT CHARACTER SET utf8 ;
USE `mitarbeiterprj` ;

-- -----------------------------------------------------
-- Table `mitarbeiterprj`.`Abteilung`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mitarbeiterprj`.`Abteilung` ;

CREATE TABLE IF NOT EXISTS `mitarbeiterprj`.`Abteilung` (
  `Abt-ID` INT NOT NULL,
  `Bezeichnung` VARCHAR(45) NULL,
  PRIMARY KEY (`Abt-ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `mitarbeiterprj`.`Mitarbeiter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mitarbeiterprj`.`Mitarbeiter` ;

CREATE TABLE IF NOT EXISTS `mitarbeiterprj`.`Mitarbeiter` (
  `Mit-Id` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Geb` VARCHAR(10) NULL,
  `Abteilung_Abt-ID` INT NOT NULL,
  PRIMARY KEY (`Mit-Id`, `Abteilung_Abt-ID`),

  CONSTRAINT `fk_Mitarbeiter_Abteilung1`
    FOREIGN KEY (`Abteilung_Abt-ID`)
    REFERENCES `mitarbeiterprj`.`Abteilung` (`Abt-ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `mitarbeiterprj`.`Projekt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mitarbeiterprj`.`Projekt` ;

CREATE TABLE IF NOT EXISTS `mitarbeiterprj`.`Projekt` (
  `idProjekt` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idProjekt`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `mitarbeiterprj`.`Projekt_has_Mitarbeiter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mitarbeiterprj`.`Projekt_has_Mitarbeiter` ;

CREATE TABLE IF NOT EXISTS `mitarbeiterprj`.`Projekt_has_Mitarbeiter` (
  `Projekt_idProjekz` INT NOT NULL,
  `Mitarbeiter_Mit-Id` INT NOT NULL,
  PRIMARY KEY (`Projekt_idProjekz`, `Mitarbeiter_Mit-Id`),

  CONSTRAINT `fk_Projekt_has_Mitarbeiter_Projekt1`
    FOREIGN KEY (`Projekt_idProjekz`)
    REFERENCES `mitarbeiterprj`.`Projekt` (`idProjekt`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projekt_has_Mitarbeiter_Mitarbeiter1`
    FOREIGN KEY (`Mitarbeiter_Mit-Id`)
    REFERENCES `mitarbeiterprj`.`Mitarbeiter` (`Mit-Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
