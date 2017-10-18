-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
-- -----------------------------------------------------
-- Schema autoshop_development
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `autoshop_development` ;

-- -----------------------------------------------------
-- Schema autoshop_development
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `autoshop_development` DEFAULT CHARACTER SET utf8 ;
USE `autoshop` ;
USE `autoshop_development` ;

-- -----------------------------------------------------
-- Table `autoshop_development`.`customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `autoshop_development`.`customers` ;

CREATE TABLE IF NOT EXISTS `autoshop_development`.`customers` (
  `cust_id` VARCHAR(8) NOT NULL,
  `cust_fname` VARCHAR(15) NOT NULL,
  `cust_lname` VARCHAR(15) NOT NULL,
  `cust_phone` VARCHAR(13) NOT NULL,
  `cust_addr` VARCHAR(30) NOT NULL,
  `cust_date` DATE NOT NULL,
  PRIMARY KEY (`cust_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `autoshop_development`.`cars`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `autoshop_development`.`cars` ;

CREATE TABLE IF NOT EXISTS `autoshop_development`.`cars` (
  `car_model` VARCHAR(10) NOT NULL,
  `car_make` VARCHAR(20) NOT NULL,
  `car_year` VARCHAR(4) NOT NULL,
  `car_vin` VARCHAR(15) NOT NULL,
  `cust_id` VARCHAR(8) NOT NULL,
  `license_plate` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`car_vin`),
  INDEX `cust_id_idx` (`cust_id` ASC),
  CONSTRAINT `cust_id`
    FOREIGN KEY (`cust_id`)
    REFERENCES `autoshop_development`.`customers` (`cust_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `autoshop_development`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `autoshop_development`.`employees` ;

CREATE TABLE IF NOT EXISTS `autoshop_development`.`employees` (
  `emp_fname` VARCHAR(20) NOT NULL,
  `emp_lname` VARCHAR(20) NOT NULL,
  `emp_id` VARCHAR(15) NOT NULL,
  `emp_wage` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`emp_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `autoshop_development`.`invoices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `autoshop_development`.`invoices` ;

CREATE TABLE IF NOT EXISTS `autoshop_development`.`invoices` (
  `cost_of_labor` DECIMAL(2,0) NULL DEFAULT NULL,
  `car_vin` VARCHAR(15) NOT NULL,
  `cust_id` VARCHAR(8) NOT NULL,
  `inv_id` INT(11) NOT NULL,
  `emp_id` VARCHAR(15) NOT NULL,
  `inv_desc` VARCHAR(255) NULL DEFAULT NULL,
  `prob_desc` VARCHAR(255) NOT NULL,
  `eng_code` VARCHAR(45) NULL DEFAULT NULL,
  `inv_date` DATE NOT NULL,
  `tot_cost` DECIMAL(2,0) NULL DEFAULT NULL,
  PRIMARY KEY (`inv_id`),
  INDEX `car_vin_idx` (`car_vin` ASC),
  INDEX `cust_id_idx` (`cust_id` ASC),
  INDEX `emp_id_idx` (`emp_id` ASC),
  CONSTRAINT `car`
    FOREIGN KEY (`car_vin`)
    REFERENCES `autoshop_development`.`cars` (`car_vin`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `cust`
    FOREIGN KEY (`cust_id`)
    REFERENCES `autoshop_development`.`customers` (`cust_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `emp`
    FOREIGN KEY (`emp_id`)
    REFERENCES `autoshop_development`.`employees` (`emp_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `autoshop_development`.`suppliers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `autoshop_development`.`suppliers` ;

CREATE TABLE IF NOT EXISTS `autoshop_development`.`suppliers` (
  `supp_id` INT(11) NOT NULL,
  `supp_name` VARCHAR(45) NOT NULL,
  `supp_address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`supp_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `autoshop_development`.`parts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `autoshop_development`.`parts` ;

CREATE TABLE IF NOT EXISTS `autoshop_development`.`parts` (
  `part_id` VARCHAR(20) NOT NULL,
  `part_name` VARCHAR(20) NOT NULL,
  `part_cost` VARCHAR(20) NOT NULL,
  `part_num_in_inventory` VARCHAR(15) NULL DEFAULT NULL,
  `supp_id` INT(11) NOT NULL,
  PRIMARY KEY (`part_id`, `supp_id`),
  INDEX `supp_id_idx` (`supp_id` ASC),
  CONSTRAINT `supp_id`
    FOREIGN KEY (`supp_id`)
    REFERENCES `autoshop_development`.`suppliers` (`supp_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `autoshop_development`.`parts_includeds`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `autoshop_development`.`parts_includeds` ;

CREATE TABLE IF NOT EXISTS `autoshop_development`.`parts_includeds` (
  `part_id` VARCHAR(20) NOT NULL,
  `inv_id` INT(11) NOT NULL,
  PRIMARY KEY (`part_id`, `inv_id`),
  INDEX `inv_id_idx` (`inv_id` ASC),
  CONSTRAINT `inv_id`
    FOREIGN KEY (`inv_id`)
    REFERENCES `autoshop_development`.`invoices` (`inv_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `part_id`
    FOREIGN KEY (`part_id`)
    REFERENCES `autoshop_development`.`parts` (`part_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;