-- MySQL Script generated by MySQL Workbench
-- Fri Oct 13 01:59:01 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema IMDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `IMDB` ;

-- -----------------------------------------------------
-- Schema IMDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `IMDB` DEFAULT CHARACTER SET utf8 ;
USE `IMDB` ;

-- -----------------------------------------------------
-- Table `IMDB`.`title_basics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`title_basics` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`title_basics` (
  `tconst` VARCHAR(12) NOT NULL,
  `primary_title` VARCHAR(255) NULL,
  `start_year` FLOAT NULL,
  `runtime` INT NULL,
  PRIMARY KEY (`tconst`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`ratings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`ratings` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`ratings` (
  `tconst` VARCHAR(12) NOT NULL,
  `average_rating` FLOAT NULL,
  `number_of_votes` INT NULL,
  PRIMARY KEY (`tconst`),
  CONSTRAINT `fk_ratings_title_basics1`
    FOREIGN KEY (`tconst`)
    REFERENCES `IMDB`.`title_basics` (`tconst`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`genres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`genres` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`genres` (
  `genre_id` INT NOT NULL AUTO_INCREMENT,
  `genre_name` VARCHAR(255) NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`title_genres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`title_genres` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`title_genres` (
  `tconst` VARCHAR(12) NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`tconst`, `genre_id`),
  INDEX `fk_title_basics_has_genres_genres1_idx` (`genre_id` ASC) VISIBLE,
  INDEX `fk_title_basics_has_genres_title_basics_idx` (`tconst` ASC) VISIBLE,
  CONSTRAINT `fk_title_basics_has_genres_title_basics`
    FOREIGN KEY (`tconst`)
    REFERENCES `IMDB`.`title_basics` (`tconst`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_title_basics_has_genres_genres1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `IMDB`.`genres` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
