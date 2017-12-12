-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema autoshop_development
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `autoshop_development` ;

-- -----------------------------------------------------
-- Schema autoshop_development
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `autoshop_development` DEFAULT CHARACTER SET utf8 ;

USE `autoshop_development` ;

-- -----------------------------------------------------
-- Table `autoshop_development`.`customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `autoshop_development`.`customers` ;

CREATE TABLE IF NOT EXISTS `autoshop_development`.`customers` (
  `cust_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `cust_fname` VARCHAR(15) NOT NULL,
  `cust_lname` VARCHAR(15) NOT NULL,
  `cust_phone` VARCHAR(13) NOT NULL,
  `cust_addr` VARCHAR(30) NOT NULL,
  `city` VARCHAR(30) NOT NULL, 
  `state` VARCHAR(20) NOT NULL,
  `cust_date` DATETIME(0) NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `autoshop_development`.`cars`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `autoshop_development`.`cars` ;

CREATE TABLE IF NOT EXISTS `autoshop_development`.`cars` (
  `car_model` VARCHAR(40) NOT NULL,
  `car_make` VARCHAR(20) NOT NULL,
  `car_year` VARCHAR(4) NOT NULL,
  `car_vin` VARCHAR(17) DEFAULT NULL,
  `cust_id` INT NOT NULL,
  `license_plate` VARCHAR(9) NOT NULL PRIMARY KEY,
  `state` CHAR(2) NOT NULL,
  `in_shop` TINYINT(1) DEFAULT TRUE, 
  FOREIGN KEY(cust_id) REFERENCES 
  customers(cust_id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `autoshop_development`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `autoshop_development`.`employees` ;

CREATE TABLE IF NOT EXISTS `autoshop_development`.`employees` (
  `emp_fname` VARCHAR(20) NOT NULL,
  `emp_lname` VARCHAR(20) NOT NULL,
  `emp_id` VARCHAR(6) NOT NULL,
  `emp_wage` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`emp_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `autoshop_development`.`invoices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `autoshop_development`.`invoices` ;

CREATE TABLE IF NOT EXISTS `autoshop_development`.`invoices` (
  `cost_of_labor` DECIMAL(6,2) NULL DEFAULT NULL,
  `license_plate` VARCHAR(8) NOT NULL,
  `cust_id` INT NOT NULL,
  `inv_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `emp_id` VARCHAR(6) NOT NULL,
  `inv_desc` VARCHAR(255) NULL DEFAULT NULL,
  `prob_desc` VARCHAR(255) NOT NULL,
  `eng_code` VARCHAR(45) NULL DEFAULT NULL,
  `inv_date` DATE NOT NULL,
  `tot_cost` DECIMAL(6,2) NULL DEFAULT NULL,
  FOREIGN KEY(cust_id) references 
  customers(cust_id), 
  FOREIGN KEY(emp_id) REFERENCES 
  employees(emp_id),
  FOREIGN KEY(license_plate) REFERENCES 
  cars(license_plate))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `autoshop_development`.`suppliers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `autoshop_development`.`suppliers` ;

CREATE TABLE IF NOT EXISTS `autoshop_development`.`suppliers` (
  `supp_id` INT NOT NULL AUTO_INCREMENT,
  `supp_name` VARCHAR(45) NOT NULL,
  `supp_address` VARCHAR(55) NOT NULL,
  `supp_phone` VARCHAR(13),
  `supp_email` VARCHAR(35),
  PRIMARY KEY (`supp_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `autoshop_development`.`parts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `autoshop_development`.`parts` ;

CREATE TABLE IF NOT EXISTS `autoshop_development`.`parts` (
  `part_id` INT NOT NULL PRIMARY KEY,
  `part_name` VARCHAR(20) NOT NULL,
  `part_cost` DECIMAL(6,2) NOT NULL,
  `part_num_in_inventory` INT NOT NULL,
  `supp_id` INT,
  FOREIGN KEY(supp_id) REFERENCES 
  suppliers(supp_id)) 
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `autoshop_development`.`included_parts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `autoshop_development`.`included_parts` ;

CREATE TABLE IF NOT EXISTS `autoshop_development`.`included_parts` (
  `part_id` INT NOT NULL,
  `inv_id` INT NOT NULL,
  PRIMARY KEY (`part_id`, `inv_id`),
  FOREIGN KEY(part_id) REFERENCES 
  parts(part_id), 
  FOREIGN KEY(inv_id) REFERENCES 
  invoices(inv_id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
