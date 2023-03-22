CREATE DATABASE universe;

\c universe;

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  size INT NOT NULL,
  age NUMERIC NOT NULL,
  has_black_hole BOOLEAN NOT NULL,
  number_of_stars INT NOT NULL
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  color VARCHAR(255) NOT NULL,
  mass NUMERIC NOT NULL,
  has_planets BOOLEAN NOT NULL,
  galaxy_id INT REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  type VARCHAR(255) NOT NULL,
  habitable BOOLEAN NOT NULL,
  distance_from_star NUMERIC NOT NULL,
  star_id INT REFERENCES star(star_id)
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  size INT NOT NULL,
  has_atmosphere BOOLEAN NOT NULL,
  temperature NUMERIC NOT NULL,
  planet_id INT REFERENCES planet(planet_id)
);s