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