/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;
\c vet_clinic;
CREATE TABLE animals(
    id int PRIMARY KEY NOT NULL,
    name text NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts int NOT NULL,
    neutered boolean NOT NULL,
    weight_kg decimal NOT NULL,
    species text NOT NULL
);

ALTER TABLE animals ADD species varchar(255);


-- Query Multiple Tables
create table owners(
    id serial primary key,
    full_name varchar(255),
    age int
)

create table species(
    id serial primary key,
    name varchar(255)
)

alter table animals drop column id;
alter table animals add column id SERIAL PRIMARY KEY;
alter table animals add column species_id int references species(id);
alter table animals add column owner_id int references owners(id);
alter table animals add column species_id int references species(id);

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age integer,
    date_of_graduation date
 );

CREATE TABLE specializations (
    id SERIAL PRIMARY KEY,
    vet_id integer REFERENCES vets(id),
    species_id integer REFERENCES species(id)
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    animal_id integer REFERENCES animals(id),
    vet_id integer REFERENCES vets(id),
    date date
);
