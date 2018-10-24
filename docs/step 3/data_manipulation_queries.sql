-- Relation Tables --
  -- record a species interaction
  INSERT INTO interaction (species1, behavior, species2) VALUES (:sp1_from_dropdown, :behavior_from_string, :sp2_from_dropdown)

  -- record an animal sighting
  INSERT INTO sighting (researcher, animal, latitude, longitude, sight_date) VALUES (:researcher_from_dropdown, :animal_from_dropdown, :lat_from_input, :long_from_input, :sighting_date_from_date_selector)

  -- give a researcher a speciality
  INSERT INTO specialty (researcher, species) VALUES (:researcher_from_dropdown, :species_from_dropdown)


-- Selection Options --
  -- show all specialities a researcher has
  SELECT researcherID, speciesID FROM speciality WHERE researcherID = :researcherID_from_dropdown_researchers_page

  -- show all researcher with a certain speciality
  SELECT speciesID, researcherID FROM speciality WHERE speciesID = :speciesID_from_dropdown_researchers_page

  -- show all sightings a researcher has logged
  SELECT  researcherID, animalID, latitude, longitude, sight_date FROM sighting WHERE researcherID = :researcherID_from_dropdown_researchers_page

  -- show all sightings a researcher has logged of one animal
  SELECT  researcherID, animalID, latitude, longitude, sight_date FROM sighting WHERE researcherID = :researcherID_from_dropdown_researchers_page, animalID = :animalID_from_dropdown

  -- show all sightings of one animal from all researchers
  SELECT  researcherID, animalID, latitude, longitude, sight_date FROM sighting WHERE animalID = :animalID_from_dropdown

  -- show all interactions a species belongs to
  SELECT species1, behavior, species2 FROM interaction WHERE species1 = :species_from_dropdown

  -- show all species that behave the same way
  SELECT species1, behavior, species2 FROM interaction WHERE behavior = :behavior_from_dropdown

  -- show an animal’s most current location
  SELECT species1, behavior, species2 FROM interaction WHERE species1 = :species_from_dropdown
