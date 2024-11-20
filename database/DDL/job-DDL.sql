SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema job_database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema job_database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `job_database` DEFAULT CHARACTER SET utf8 ;
USE `job_database` ;

-- -----------------------------------------------------
-- Table `job_database`.`job_by_calendar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_database`.`job_by_calendar` (
  `jobs_by_calendar_id` VARCHAR(50) NOT NULL,
  `job_id` VARCHAR(50) NOT NULL,
  `calendar_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`jobs_by_calendar_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_database`.`periodic_job`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_database`.`periodic_job` (
  `job_id` VARCHAR(50) NOT NULL,
  `job_by_calendar_id` VARCHAR(50) NOT NULL,
  `customer_id` VARCHAR(50) NOT NULL,
  `employee_id` VARCHAR(45) NOT NULL,
  `periodicity` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`job_id`),
  INDEX `fk_job_job_by_calendar1_idx` (`job_by_calendar_id` ASC) VISIBLE,
  CONSTRAINT `fk_job_job_by_calendar1`
    FOREIGN KEY (`job_by_calendar_id`)
    REFERENCES `job_database`.`job_by_calendar` (`jobs_by_calendar_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_database`.`job`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_database`.`job` (
  `job_id` VARCHAR(50) NOT NULL,
  `job_by_calendar_id` VARCHAR(50) NOT NULL,
  `customer_id` VARCHAR(50) NOT NULL,
  `employee_id` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`job_id`),
  INDEX `fk_job_job_by_calendar1_idx` (`job_by_calendar_id` ASC) VISIBLE,
  CONSTRAINT `fk_job_job_by_calendar10`
    FOREIGN KEY (`job_by_calendar_id`)
    REFERENCES `job_database`.`job_by_calendar` (`jobs_by_calendar_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_database`.`appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_database`.`appointment` (
  `appointment_id` VARCHAR(50) NOT NULL,
  `job_id` VARCHAR(50) NOT NULL,
  `start_date` TIMESTAMP NOT NULL,
  `end_date` TIMESTAMP NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `next_end_date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`appointment_id`),
  INDEX `fk_appointment_job1_idx` (`job_id` ASC) VISIBLE,
  CONSTRAINT `fk_appointment_job1`
    FOREIGN KEY (`job_id`)
    REFERENCES `job_database`.`periodic_job` (`job_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_job2`
    FOREIGN KEY (`job_id`)
    REFERENCES `job_database`.`job` (`job_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_database`.`users_by_calendar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_database`.`users_by_calendar` (
  `users_by_calendar_id` VARCHAR(50) NOT NULL,
  `calendar_id` VARCHAR(50) NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`users_by_calendar_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_database`.`calendar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_database`.`calendar` (
  `calendar_id` VARCHAR(50) NOT NULL,
  `jobs_by_calendar_id` VARCHAR(50) NULL,
  `user_by_calendar_id` VARCHAR(50) NULL,
  `calendar_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`calendar_id`),
  INDEX `fk_calendar_job_by_calendar1_idx` (`jobs_by_calendar_id` ASC) VISIBLE,
  INDEX `fk_calendar_users_by_calendar1_idx` (`user_by_calendar_id` ASC) VISIBLE,
  CONSTRAINT `fk_calendar_job_by_calendar1`
    FOREIGN KEY (`jobs_by_calendar_id`)
    REFERENCES `job_database`.`job_by_calendar` (`jobs_by_calendar_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_calendar_users_by_calendar1`
    FOREIGN KEY (`user_by_calendar_id`)
    REFERENCES `job_database`.`users_by_calendar` (`users_by_calendar_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE USER 'admin' IDENTIFIED BY 'admin-gespyme-2024-99Pabcde';
GRANT ALL PRIVILEGES ON job_database.* TO 'admin'@'%';

CREATE USER 'reader' IDENTIFIED BY 'admin-gespyme-2024-99Qabcde';
GRANT SELECT ON TABLE `job_database`.* TO 'reader'@'%';

CREATE USER 'employee' IDENTIFIED BY 'employee-gespyme-2024-99Qabcde';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `job_database`.* TO 'employee'@'%';
GRANT SELECT, INSERT, TRIGGER ON TABLE `job_database`.* TO 'employee';
GRANT SELECT ON TABLE `job_database`.* TO 'employee';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
