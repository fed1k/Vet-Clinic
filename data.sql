/* Populate database with sample data. */

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(1, 'Agumon', date '03-02-2020', 0, true, 10.23);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(2, 'Gabumon', date '2018-11-13', 2, true, 8);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(3, 'Pikachu', date '2021-01-07', 1, false, 15.04);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(4, 'Devimon', date '2017-05-12', 5, true, 11);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(5, 'Charmander', date '2020-02-08', 0, false, -11);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(6, 'Plantmon', date '2021-11-15', 2, true, -5.7);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(7, 'Squirtle', date '1993-04-02', 3, false, -12.13);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(8, 'Angemon', date '2005-06-12', 1, true, -45);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(9, 'Boarmon', date '2005-06-07', 7, true, 20.4);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(10, 'Blossom', date '1998-10-13', 3, true, 17);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(11, 'Ditto', date '2022-05-14', 4, true, 22);

BEGIN;
SAVEPOINT speciespoint;
UPDATE animals SET species = 'unspecified';
SELECT * FROM ANIMALS;
ROLLBACK TO SAVEPOINT speciespoint;
COMMIT;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
update animals set species = 'pokemon' where species is null;
commit;
select * from animals;

begin;
delete from animals;
select * from animals;
rollback;
select * from animals;

begin;
delete from animals where date_of_birth > '2022-01-01';
select * from animals;
SAVEPOINT deleted;
update animals set weight_kg = weight_kg * - 1;
select * from animals;
update animals set weight_kg = weight_kg * - 1 where weight_kg < 0;
select * from animals;
commit;

-- Owners data
insert into owners(full_name, age) values('Sam Smith', 34);
insert into owners(full_name, age) values('Jennifer Orwell', 19);
insert into owners(full_name, age) values('Bob', 45);
insert into owners(full_name, age) values('Melody Pond', 77);
insert into owners(full_name, age) values('Dean Winchester', 14);
insert into owners(full_name, age) values('Jodie Whittaker', 38);

-- Species data
insert into species(name) values('Digimon');
insert into species(name) values('Pokemon');
UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';
UPDATE animals
SET species_id = 1
WHERE species_id IS NULL;
UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';
UPDATE animals
SET owner_id = 2
WHERE name = 'Pikachu' OR name = 'Gabumon';
UPDATE animals
SET owner_id = 3
WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals
SET owner_id = 4
WHERE name = 'Charmander' OR name = 'Squirtle'
OR name = 'Blossom';
UPDATE animals
SET owner_id = 5
WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Maisy Smith', 26, '2019-01-17');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Jack Harkness', 38, '2008-06-08');

-- Insert Specialties data

INSERT INTO specializations (vet_id, species_id)
VALUES (4, 1);

INSERT INTO specializations (vet_id, species_id)
VALUES (6, 2);

INSERT INTO specializations (vet_id, species_id)
VALUES (6, 1);

INSERT INTO specializations (vet_id, species_id)
VALUES (7, 2);

-- Insert Visits data

INSERT INTO visits (animal_id, vet_id, date)
VALUES (2, 4, '2020-05-24');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (2, 6, '2020-07-22');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (3, 7, '2021-02-02');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (6, 5, '2020-01-05');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (6, 5, '2020-03-08');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (6, 5, '2020-05-14');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (4, 6, '2021-05-04');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (10, 7, '2021-02-24');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (8, 5, '2019-12-21');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (8, 4, '2020-08-10');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (8, 5, '2021-04-07');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (11, 6, '2019-09-29');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (9, 7, '2020-10-03');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (9, 7, '2020-11-04');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (5, 5, '2019-01-24');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (5, 5, '2019-05-15');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (5, 5, '2020-02-27');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (5, 5, '2020-08-03');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (7, 6, '2020-05-24');

INSERT INTO visits (animal_id, vet_id, date)
VALUES (7, 4, '2021-01-11');