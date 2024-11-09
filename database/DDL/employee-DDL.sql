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
-- Table `mydb`.`AUTH_INFO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AUTH_INFO` (
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
-- Table `mydb`.`USER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`USER` (
  `user_id` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `auth_info` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_USER_AUTH_INFO_idx` (`auth_info` ASC) VISIBLE,
  CONSTRAINT `fk_USER_AUTH_INFO`
    FOREIGN KEY (`auth_info`)
    REFERENCES `mydb`.`AUTH_INFO` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE USER 'admin' IDENTIFIED BY 'admin-gespyme-2024-99Pabcde';

GRANT ALL ON `mydb`.* TO 'admin';
CREATE USER 'reader' IDENTIFIED BY 'reader-gespyme-2024-99Qabcde';

GRANT SELECT ON TABLE `mydb`.* TO 'reader';
CREATE USER 'employee' IDENTIFIED BY 'employee-gespyme-2024-99Qabcde';

GRANT SELECT, INSERT, TRIGGER ON TABLE `mydb`.* TO 'employee';
GRANT SELECT ON TABLE `mydb`.* TO 'employee';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `mydb`.* TO 'employee';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
