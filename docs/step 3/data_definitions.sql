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



INSERT INTO `species` (`speciesID`, `name`, `feeding_type`, `native`, `domesticated`)
  VALUES (NULL, 'squirrel', 'omnivore', '1', '0'),
  (NULL, 'coyote', 'carnivore', '1', '0'),
  (NULL, 'barn owl', 'carnivore', '1', '0'),
  (NULL, 'nutria', 'omnivore', '0', '0');

INSERT INTO `biome` (`biomeID`, `name`, `lat_1`, `long_1`, `lat_2`, `long_2`, `temperature`, `elevation`, `rainfall`)
  VALUES (NULL, 'wetlands', '45.8', '112.2', '66.5', '117.1', '68.3', '872.1', '124.9'),
  (NULL, 'high desert', '94.0', '143.5', '101.7', '150.2', '78.9', '3047.8', '36.19'),
  (NULL, 'coast', '32.5', '102.2', '45.6', '145.7', '56.8', '51.9', '98.6');

INSERT INTO `researcher` (`researcherID`, `first_name`, `last_name`, `position`)
  VALUES (NULL, 'Susanne', 'Hills', 'Post Doc'),
  (NULL, 'Jeffrey', 'Dawn', 'Graduate Researcher'),
  (NULL, 'Robin', 'Newart', 'Undergraduate Assistant'),
  (NULL, 'Stephen', 'Long', 'Undergraduate Assistant');

INSERT INTO `animal` (`animalID`, `age`, `speciesID`, `biomeID`)
  VALUES (NULL, '1', '1', '2'),
  (NULL, '3', '1', '2'),
  (NULL, '4', '2', '3'),
  (NULL, '6', '3', '1'),
  (NULL, '2', '4', '1'),
  (NULL, '7', '2', '2'),
  (NULL, '3', '1', '2');

INSERT INTO `interaction` (`species_1`, `behavior`, `species_2`)
  VALUES ('2', 'eats', '1'),
  ('3', 'eats', '1'),
  ('2', 'eats', '4'),
  ('2', 'scavenges', '3');

INSERT INTO `speciality` (`researcherID`, `speciesID`)
  VALUES ('1', '3'),
  ('3', '2'),
  ('2', '1'),
  ('2', '4');

INSERT INTO `sighting` (`researcherID`, `animalID`, `latitude`, `longitude`, `sight_date`)
  VALUES ('1', '4', '79.9', '114.5', '2017-09-13'),
  ('2', '2', '55.4', '136.8', '2018-03-07'),
  ('2', '5', '50.3', '130.1', '2018-03-09'),
  ('4', '6', '84.2', '154.2', '2017-03-28'),
  ('3', '7', '63.3', '99.6', '2018-07-06');
