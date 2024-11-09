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
-- Table `mydb`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMER` (
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

GRANT ALL ON `mydb`.* TO 'admin';
CREATE USER 'reader' IDENTIFIED BY 'admin-gespyme-2024-99Qabcde';

GRANT SELECT ON TABLE `mydb`.* TO 'reader';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
