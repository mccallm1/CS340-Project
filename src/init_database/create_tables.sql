DROP TABLE IF EXISTS `speciality`;
DROP TABLE IF EXISTS `sighting`;
DROP TABLE IF EXISTS `interaction`;
DROP TABLE IF EXISTS `researcher`;
DROP TABLE IF EXISTS `animal`;
DROP TABLE IF EXISTS `biome`;
DROP TABLE IF EXISTS `species`;

CREATE TABLE `cs340_mccallm`.`animal` (
  `animalID` INT NOT NULL AUTO_INCREMENT ,
  `age` INT NOT NULL ,
  `speciesID` INT NOT NULL ,
  `biomeID` INT NOT NULL ,
  PRIMARY KEY (`animalID`)
) ENGINE = InnoDB;

CREATE TABLE `cs340_mccallm`.`species` (
  `speciesID` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(50) NOT NULL DEFAULT 'other' ,
  `feeding_type` VARCHAR(50) NOT NULL ,
  `native` BOOLEAN NOT NULL ,
  `domesticated` BOOLEAN NOT NULL ,
  PRIMARY KEY (`speciesID`)
) ENGINE = InnoDB;

CREATE TABLE `cs340_mccallm`.`biome` (
  `biomeID` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(50) NOT NULL ,
  `lat_1` FLOAT NOT NULL ,
  `long_1` FLOAT NOT NULL ,
  `lat_2` FLOAT NOT NULL ,
  `long_2` FLOAT NOT NULL ,
  `temperature` FLOAT NOT NULL ,
  `elevation` FLOAT NOT NULL ,
  `rainfall` FLOAT NOT NULL ,
  PRIMARY KEY (`biomeID`)
) ENGINE = InnoDB;

ALTER TABLE `animal` ADD FOREIGN KEY (`speciesID`) REFERENCES `species`(`speciesID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `animal` ADD FOREIGN KEY (`biomeID`) REFERENCES `biome`(`biomeID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE `cs340_mccallm`.`researcher` (
  `researcherID` INT NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(50) NOT NULL ,
  `last_name` VARCHAR(50) NOT NULL ,
  `position` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`researcherID`)
) ENGINE = InnoDB;

CREATE TABLE `cs340_mccallm`.`interaction` (
  `species_1` INT NOT NULL ,
  `behavior` VARCHAR(50) NOT NULL ,
  `species_2` INT NOT NULL
) ENGINE = InnoDB;
ALTER TABLE `interaction` ADD FOREIGN KEY (`species_1`) REFERENCES `species`(`speciesID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `interaction` ADD FOREIGN KEY (`species_2`) REFERENCES `species`(`speciesID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE `cs340_mccallm`.`sighting` (
  `researcherID` INT NOT NULL ,
  `animalID` INT NOT NULL ,
  `latitude` FLOAT NOT NULL ,
  `longitude` FLOAT NOT NULL ,
  `sight_date` DATE NOT NULL
) ENGINE = InnoDB;
ALTER TABLE `sighting` ADD FOREIGN KEY (`researcherID`) REFERENCES `researcher`(`researcherID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `sighting` ADD FOREIGN KEY (`animalID`) REFERENCES `animal`(`animalID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE `cs340_mccallm`.`speciality` (
  `researcherID` INT NOT NULL ,
  `speciesID` INT NOT NULL
) ENGINE = InnoDB;
ALTER TABLE `speciality` ADD FOREIGN KEY (`researcherID`) REFERENCES `researcher`(`researcherID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `speciality` ADD FOREIGN KEY (`speciesID`) REFERENCES `species`(`speciesID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
