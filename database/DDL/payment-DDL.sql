SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema payment_database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema payment_database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `payment_database` DEFAULT CHARACTER SET utf8 ;
USE `payment_database` ;

-- -----------------------------------------------------
-- Table `payment_database`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payment_database`.`payment` (
  `payment_id` INT NOT NULL,
  `appointment_id` VARCHAR(50) NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`payment_id`))
ENGINE = InnoDB;

CREATE USER 'admin' IDENTIFIED BY 'admin-gespyme-2024-99Pabcde';
GRANT ALL PRIVILEGES ON payment_database.* TO 'admin'@'%';

CREATE USER 'reader' IDENTIFIED BY 'admin-gespyme-2024-99Qabcde';
GRANT SELECT ON TABLE `payment_database`.* TO 'reader'@'%';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
