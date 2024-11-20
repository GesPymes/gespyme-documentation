SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema customer_database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema customer_database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `customer_database` DEFAULT CHARACTER SET utf8 ;
USE `customer_database` ;

-- -----------------------------------------------------
-- Table `customer_database`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `customer_database`.`customer` (
  `customer_id` VARCHAR(45) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `address` VARCHAR(355) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `mobile_phone` VARCHAR(20) NOT NULL,
  `needs_invoice` INT NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;

CREATE USER 'admin' IDENTIFIED BY 'admin-gespyme-2024-99Pabcde';
GRANT ALL PRIVILEGES ON customer_database.* TO 'admin'@'%';

CREATE USER 'reader' IDENTIFIED BY 'admin-gespyme-2024-99Qabcde';
GRANT SELECT ON TABLE `customer_database`.* TO 'reader'@'%';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
