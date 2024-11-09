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
-- Table `mydb`.`JOB_BY_CALENDAR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`JOB_BY_CALENDAR` (
  `jobs_by_calendar_id` VARCHAR(50) NOT NULL,
  `job_id` VARCHAR(50) NOT NULL,
  `calendar_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`jobs_by_calendar_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PERIODIC_JOB`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PERIODIC_JOB` (
  `job_id` VARCHAR(50) NOT NULL,
  `job_by_calendar_id` VARCHAR(50) NOT NULL,
  `customer_id` VARCHAR(50) NOT NULL,
  `employee_id` VARCHAR(45) NOT NULL,
  `periodicity` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`job_id`),
  INDEX `fk_JOB_JOB_BY_CALENDAR1_idx` (`job_by_calendar_id` ASC) VISIBLE,
  CONSTRAINT `fk_JOB_JOB_BY_CALENDAR1`
    FOREIGN KEY (`job_by_calendar_id`)
    REFERENCES `mydb`.`JOB_BY_CALENDAR` (`jobs_by_calendar_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`JOB`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`JOB` (
  `job_id` VARCHAR(50) NOT NULL,
  `job_by_calendar_id` VARCHAR(50) NOT NULL,
  `customer_id` VARCHAR(50) NOT NULL,
  `employee_id` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`job_id`),
  INDEX `fk_JOB_JOB_BY_CALENDAR1_idx` (`job_by_calendar_id` ASC) VISIBLE,
  CONSTRAINT `fk_JOB_JOB_BY_CALENDAR10`
    FOREIGN KEY (`job_by_calendar_id`)
    REFERENCES `mydb`.`JOB_BY_CALENDAR` (`jobs_by_calendar_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`APPOINTMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`APPOINTMENT` (
  `appointment_id` VARCHAR(50) NOT NULL,
  `job_id` VARCHAR(50) NOT NULL,
  `start_date` TIMESTAMP NOT NULL,
  `end_date` TIMESTAMP NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `next_end_date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`appointment_id`),
  INDEX `fk_APPOINTMENT_JOB1_idx` (`job_id` ASC) VISIBLE,
  CONSTRAINT `fk_APPOINTMENT_JOB1`
    FOREIGN KEY (`job_id`)
    REFERENCES `mydb`.`PERIODIC_JOB` (`job_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_APPOINTMENT_JOB2`
    FOREIGN KEY (`job_id`)
    REFERENCES `mydb`.`JOB` (`job_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`USERS_BY_CALENDAR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`USERS_BY_CALENDAR` (
  `users_by_calendar_id` VARCHAR(50) NOT NULL,
  `calendar_id` VARCHAR(50) NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`users_by_calendar_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CALENDAR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CALENDAR` (
  `calendar_id` VARCHAR(50) NOT NULL,
  `jobs_by_calendar_id` VARCHAR(50) NULL,
  `user_by_calendar_id` VARCHAR(50) NULL,
  `calendar_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`calendar_id`),
  INDEX `fk_CALENDAR_JOB_BY_CALENDAR1_idx` (`jobs_by_calendar_id` ASC) VISIBLE,
  INDEX `fk_CALENDAR_USERS_BY_CALENDAR1_idx` (`user_by_calendar_id` ASC) VISIBLE,
  CONSTRAINT `fk_CALENDAR_JOB_BY_CALENDAR1`
    FOREIGN KEY (`jobs_by_calendar_id`)
    REFERENCES `mydb`.`JOB_BY_CALENDAR` (`jobs_by_calendar_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CALENDAR_USERS_BY_CALENDAR1`
    FOREIGN KEY (`user_by_calendar_id`)
    REFERENCES `mydb`.`USERS_BY_CALENDAR` (`users_by_calendar_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE USER 'admin' IDENTIFIED BY 'admin-gespyme-2024-99Pabcde';

GRANT ALL ON `mydb`.* TO 'admin';
CREATE USER 'reader' IDENTIFIED BY 'admin-gespyme-2024-99Qabcde';

GRANT SELECT ON TABLE `mydb`.* TO 'reader';
CREATE USER 'employee' IDENTIFIED BY 'employee-gespyme-2024-99Qabcde';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `mydb`.* TO 'employee';
GRANT SELECT, INSERT, TRIGGER ON TABLE `mydb`.* TO 'employee';
GRANT SELECT ON TABLE `mydb`.* TO 'employee';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
