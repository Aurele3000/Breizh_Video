-- MySQL Script generated by MySQL Workbench
-- Fri Dec 18 15:00:17 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema breizhvideo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema breizhvideo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `breizhvideo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `breizhvideo` ;

-- -----------------------------------------------------
-- Table `breizhvideo`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `breizhvideo`.`actor` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_actor_last_name` (`last_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 201
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `breizhvideo`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `breizhvideo`.`category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `breizhvideo`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `breizhvideo`.`film` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` YEAR NULL DEFAULT NULL,
  `length` SMALLINT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_title` (`title` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2001
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `breizhvideo`.`village`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `breizhvideo`.`village` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `post_code` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `breizhvideo`.`show`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `breizhvideo`.`show` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `release_date` DATE NULL DEFAULT NULL,
  `village_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_show_village1_idx` (`village_id` ASC) VISIBLE,
  CONSTRAINT `fk_show_village1`
    FOREIGN KEY (`village_id`)
    REFERENCES `breizhvideo`.`village` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `breizhvideo`.`preference`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `breizhvideo`.`preference` (
  `id` INT NOT NULL,
  `vote` INT NULL DEFAULT NULL,
  `film_id` INT UNSIGNED NOT NULL,
  `show_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_preference_film1_idx` (`film_id` ASC) VISIBLE,
  INDEX `fk_preference_show1_idx` (`show_id` ASC) VISIBLE,
  CONSTRAINT `fk_preference_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `breizhvideo`.`film` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_preference_show1`
    FOREIGN KEY (`show_id`)
    REFERENCES `breizhvideo`.`show` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `breizhvideo`.`film_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `breizhvideo`.`film_actor` (
  `film_id` INT UNSIGNED NOT NULL,
  `actor_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`film_id`, `actor_id`),
  INDEX `fk_film_actor_actor1_idx` (`actor_id` ASC) VISIBLE,
  INDEX `fk_film_actor_film1_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_actor_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `breizhvideo`.`film` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_film_actor_actor1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `breizhvideo`.`actor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `breizhvideo`.`film_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `breizhvideo`.`film_category` (
  `film_id` INT UNSIGNED NOT NULL,
  `category_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`film_id`, `category_id`),
  INDEX `fk_film_category_category1_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_film_category_film1_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_category_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `breizhvideo`.`film` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_film_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `breizhvideo`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;