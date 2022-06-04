/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon%';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name from animals WHERE neutered = true and escape_attempts < 3;
SELECT date_of_birth from animals where name LIKE 'Agumon' or name LIKE 'Pikachu';
SELECT name, escape_attempts from animals where weight_kg > 10.5;
SELECT * from animals where neutered = true;
SELECT * from animals where name != 'Gabumon';
SELECT * from animals where weight_kg >= 10.4 and weight_kg <= 17.3;

-- Number of Animals
select count(*) from animals;

-- Number of Animals which never tried to escape
select count(*) from animals where escape_attempts = 0;

-- Average weight of Animals
select avg(weight_kg) from animals;

-- Who escapes the most
select max(escape_attempts) from animals;
select name from animals where escape_attempts = 7;

-- Minimum and Maximum weight of each type of Animal
select min(weight_kg), max(weight_kg) from animals group by species;

-- Average number of escapes born between 1990 and 2000

select avg(escape_attempts) from animals where date_of_birth between '1990-01-01' and '2000-01-01' group by species;

SELECT animals.name FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';
SELECT animals.name FROM animals
JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';
SELECT owners.full_name, animals.name FROM owners
RIGHT JOIN animals
ON owners.id = animals.owner_id;
SELECT species.name, COUNT(*) FROM animals
JOIN species
ON animals.species_id = species.id
GROUP BY species.name;
SELECT animals.name FROM animals
JOIN owners
ON animals.owner_id = owners.id
JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';
SELECT animals.name FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT owners.full_name FROM animals
JOIN owners
ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY COUNT(owner_id) DESC
LIMIT 1;

SELECT animals.name FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date DESC;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(animals.name) FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez' AND visits.date >= '2020-04-01' AND visits.date <= '2020-08-30';

-- What animal has the most visits to vets?
SELECT animals.name FROM animals
JOIN visits ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY COUNT(visits.animal_id) DESC
LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT animals.name FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date ASC
LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.*, vets.*, visits.date FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
ORDER BY visits.date DESC
LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM Visits
JOIN animals ON visits.animal_id = animals.id
JOIN vets ON visits.vet_id = vets.ID
JOIN specializations ON vets.id = specializations.vet_id
JOIN species ON specializations.species_id = species.id
WHERE animals.species_id NOT IN (
  SELECT specializations.species_id FROM vets
JOIN specializations ON vets.id = specializations.vet_id
WHERE vets.id = visits.vet_id
);

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(species.name) FROM vets
JOIN visits ON vets.id = visits.vet_id
JOIN animals ON visits.animal_id = animals.id
JOIN species ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
LIMIT 1;