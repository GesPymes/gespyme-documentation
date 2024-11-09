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
-- Table `mydb`.`INVOICE_DATA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`INVOICE_DATA` (
  `invoice_data_id` VARCHAR(50) NOT NULL,
  `appointment_id` VARCHAR(50) NOT NULL,
  `subtotal_amount` INT NOT NULL,
  `tax_rate` INT NOT NULL,
  `total_amount` INT NOT NULL,
  PRIMARY KEY (`invoice_data_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`INVOICE_ORDER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`INVOICE_ORDER` (
  `invoice_order_id` VARCHAR(50) NOT NULL,
  `invoice_data_id` VARCHAR(50) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `appointmentId` VARCHAR(45) NULL,
  `INVOICE_ORDERcol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`invoice_order_id`),
  INDEX `fk_INVOICE_ORDER_INVOICE_DATA1_idx` (`invoice_data_id` ASC) VISIBLE,
  CONSTRAINT `fk_INVOICE_ORDER_INVOICE_DATA1`
    FOREIGN KEY (`invoice_data_id`)
    REFERENCES `mydb`.`INVOICE_DATA` (`invoice_data_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE USER 'admin' IDENTIFIED BY 'admin-gespyme-2024-99Pabcde';

GRANT ALL ON `mydb`.* TO 'admin';
CREATE USER 'reader' IDENTIFIED BY 'admin-gespyme-2024-99Qabcde';

GRANT SELECT ON TABLE `mydb`.* TO 'reader';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
