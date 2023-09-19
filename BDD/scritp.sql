-- MySQL Script generated by MySQL Workbench
-- Sat Sep 16 20:05:25 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema resgistro_escuela
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `resgistro_escuela` ;

-- -----------------------------------------------------
-- Schema resgistro_escuela
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `resgistro_escuela` DEFAULT CHARACTER SET utf8 ;
USE `resgistro_escuela` ;

-- -----------------------------------------------------
-- Table `resgistro_escuela`.`colegio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resgistro_escuela`.`colegio` ;

CREATE TABLE IF NOT EXISTS `resgistro_escuela`.`colegio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resgistro_escuela`.`curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resgistro_escuela`.`curso` ;

CREATE TABLE IF NOT EXISTS `resgistro_escuela`.`curso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `grado` INT NOT NULL,
  `salon` VARCHAR(2) NOT NULL,
  `colegio_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_curso_colegio_idx` (`colegio_id` ASC),
  CONSTRAINT `fk_curso_colegio`
    FOREIGN KEY (`colegio_id`)
    REFERENCES `resgistro_escuela`.`colegio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resgistro_escuela`.`profesor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resgistro_escuela`.`profesor` ;

CREATE TABLE IF NOT EXISTS `resgistro_escuela`.`profesor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resgistro_escuela`.`asignatura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resgistro_escuela`.`asignatura` ;

CREATE TABLE IF NOT EXISTS `resgistro_escuela`.`asignatura` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` LONGTEXT NOT NULL,
  `curso_id` INT NOT NULL,
  `profesor_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_asignatura_curso1_idx` (`curso_id` ASC),
  INDEX `fk_asignatura_profesor1_idx` (`profesor_id` ASC),
  CONSTRAINT `fk_asignatura_curso1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `resgistro_escuela`.`curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignatura_profesor1`
    FOREIGN KEY (`profesor_id`)
    REFERENCES `resgistro_escuela`.`profesor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resgistro_escuela`.`estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resgistro_escuela`.`estudiante` ;

CREATE TABLE IF NOT EXISTS `resgistro_escuela`.`estudiante` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resgistro_escuela`.`inscrito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resgistro_escuela`.`inscrito` ;

CREATE TABLE IF NOT EXISTS `resgistro_escuela`.`inscrito` (
  `asignatura_id` INT NOT NULL,
  `estudiante_id` INT NOT NULL,
  PRIMARY KEY (`asignatura_id`, `estudiante_id`),
  INDEX `fk_asignatura_has_estudiante_estudiante1_idx` (`estudiante_id` ASC),
  INDEX `fk_asignatura_has_estudiante_asignatura1_idx` (`asignatura_id` ASC),
  CONSTRAINT `fk_asignatura_has_estudiante_asignatura1`
    FOREIGN KEY (`asignatura_id`)
    REFERENCES `resgistro_escuela`.`asignatura` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignatura_has_estudiante_estudiante1`
    FOREIGN KEY (`estudiante_id`)
    REFERENCES `resgistro_escuela`.`estudiante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `resgistro_escuela`.`colegio`
-- -----------------------------------------------------
START TRANSACTION;
USE `resgistro_escuela`;
INSERT INTO `resgistro_escuela`.`colegio` (`id`, `nombre`) VALUES (1, 'Parroquial');
INSERT INTO `resgistro_escuela`.`colegio` (`id`, `nombre`) VALUES (2, 'IED Laura');

COMMIT;


-- -----------------------------------------------------
-- Data for table `resgistro_escuela`.`curso`
-- -----------------------------------------------------
START TRANSACTION;
USE `resgistro_escuela`;
INSERT INTO `resgistro_escuela`.`curso` (`id`, `grado`, `salon`, `colegio_id`) VALUES (1, 1, 'A', 1);
INSERT INTO `resgistro_escuela`.`curso` (`id`, `grado`, `salon`, `colegio_id`) VALUES (2, 1, 'B', 1);
INSERT INTO `resgistro_escuela`.`curso` (`id`, `grado`, `salon`, `colegio_id`) VALUES (3, 2, 'A', 1);
INSERT INTO `resgistro_escuela`.`curso` (`id`, `grado`, `salon`, `colegio_id`) VALUES (4, 2, 'B', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `resgistro_escuela`.`profesor`
-- -----------------------------------------------------
START TRANSACTION;
USE `resgistro_escuela`;
INSERT INTO `resgistro_escuela`.`profesor` (`id`, `nombre`) VALUES (1, 'camacho');
INSERT INTO `resgistro_escuela`.`profesor` (`id`, `nombre`) VALUES (2, 'juares');
INSERT INTO `resgistro_escuela`.`profesor` (`id`, `nombre`) VALUES (3, 'mercado');

COMMIT;


-- -----------------------------------------------------
-- Data for table `resgistro_escuela`.`asignatura`
-- -----------------------------------------------------
START TRANSACTION;
USE `resgistro_escuela`;
INSERT INTO `resgistro_escuela`.`asignatura` (`id`, `nombre`, `curso_id`, `profesor_id`) VALUES (1, 'matematica', 1, NULL);
INSERT INTO `resgistro_escuela`.`asignatura` (`id`, `nombre`, `curso_id`, `profesor_id`) VALUES (2, 'ciencias', 1, NULL);
INSERT INTO `resgistro_escuela`.`asignatura` (`id`, `nombre`, `curso_id`, `profesor_id`) VALUES (3, 'informatica', 2, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `resgistro_escuela`.`estudiante`
-- -----------------------------------------------------
START TRANSACTION;
USE `resgistro_escuela`;
INSERT INTO `resgistro_escuela`.`estudiante` (`id`, `nombre`) VALUES (1, 'juan');
INSERT INTO `resgistro_escuela`.`estudiante` (`id`, `nombre`) VALUES (2, 'pedro');
INSERT INTO `resgistro_escuela`.`estudiante` (`id`, `nombre`) VALUES (3, 'mauricio');
INSERT INTO `resgistro_escuela`.`estudiante` (`id`, `nombre`) VALUES (4, 'maria');
INSERT INTO `resgistro_escuela`.`estudiante` (`id`, `nombre`) VALUES (5, 'pepa');

COMMIT;

