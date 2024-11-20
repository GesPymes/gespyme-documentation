SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema invoice_database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema invoice_database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `invoice_database` DEFAULT CHARACTER SET utf8 ;
USE `invoice_database` ;

-- -----------------------------------------------------
-- Table `invoice_database`.`invoice_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invoice_database`.`invoice_data` (
  `invoice_data_id` VARCHAR(50) NOT NULL,
  `appointment_id` VARCHAR(50) NOT NULL,
  `subtotal_amount` INT NOT NULL,
  `tax_rate` INT NOT NULL,
  `total_amount` INT NOT NULL,
  PRIMARY KEY (`invoice_data_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `invoice_database`.`invoice_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invoice_database`.`invoice_order` (
  `invoice_order_id` VARCHAR(50) NOT NULL,
  `invoice_data_id` VARCHAR(50) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `appointmentId` VARCHAR(45) NULL,
  `invoice_ordercol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`invoice_order_id`),
  INDEX `fk_invoice_order_invoice_data1_idx` (`invoice_data_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoice_order_invoice_data1`
    FOREIGN KEY (`invoice_data_id`)
    REFERENCES `invoice_database`.`invoice_data` (`invoice_data_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE USER 'admin' IDENTIFIED BY 'admin-gespyme-2024-99Pabcde';
GRANT ALL PRIVILEGES ON invoice_database.* TO 'admin'@'%';

CREATE USER 'reader' IDENTIFIED BY 'admin-gespyme-2024-99Qabcde';
GRANT SELECT ON TABLE `invoice_database`.* TO 'reader'@'%';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
