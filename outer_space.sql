-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE stars
(
    id SERIAL PRIMARY KEY,
    star TEXT NOT NULL
);

CREATE TABLE galaxies
(
    id SERIAL PRIMARY KEY,
    galaxy TEXT NOT NULL
);


CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INT REFERENCES stars,
  galaxy INT REFERENCES galaxies,
  moons TEXT 
);






INSERT INTO stars (star)
VALUES
('The Sun'),
('Proxima Centauri'),
('Gliese 876');

INSERT INTO galaxies (galaxy)
VALUES
('Milky Way');


INSERT INTO planets
  (name, orbital_period_in_years, orbits_around,galaxy, moons)
VALUES
  ('Earth', 1.00, 1,1,'the moon'),
  ('Mars', 1.88,1,1, 'the mars moon');
 