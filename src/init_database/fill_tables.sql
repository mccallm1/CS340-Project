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
