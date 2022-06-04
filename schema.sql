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
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name varchar(255),
    age int
)

create table species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(255)
)