SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema employee_database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema employee_database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `employee_database` DEFAULT CHARACTER SET utf8 ;
USE `employee_database` ;

-- -----------------------------------------------------
-- Table `employee_database`.`auth_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_database`.`auth_info` (
  `user_id` VARCHAR(45) NOT NULL,
  `token` VARCHAR(225) NOT NULL,
  `is_valid` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `last_time_logged_in` VARCHAR(255) NOT NULL,
  `creation_date` VARCHAR(255) NOT NULL,
  `modification_date` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employee_database`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_database`.`user` (
  `user_id` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `auth_info` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_user_auth_info_idx` (`auth_info` ASC) VISIBLE,
  CONSTRAINT `fk_user_auth_info`
    FOREIGN KEY (`auth_info`)
    REFERENCES `employee_database`.`auth_info` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE user 'admin' IDENTIFIED BY 'admin-gespyme-2024-99Pabcde';
GRANT ALL PRIVILEGES ON employee_database.* TO 'admin'@'%';

CREATE user 'reader' IDENTIFIED BY 'reader-gespyme-2024-99Qabcde';
GRANT SELECT ON TABLE `employee_database`.* TO 'reader'@'%';

GRANT SELECT ON TABLE `employee_database`.* TO 'reader';
CREATE user 'employee' IDENTIFIED BY 'employee-gespyme-2024-99Qabcde';

GRANT SELECT, INSERT, TRIGGER ON TABLE `employee_database`.* TO 'employee';
GRANT SELECT ON TABLE `employee_database`.* TO 'employee';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `employee_database`.* TO 'employee';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
