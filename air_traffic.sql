-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic;

CREATE TABLE airlines
( id SERIAL PRIMARY KEY,
  company TEXT NOT NULL
);

CREATE TABLE passengers
( id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE cities
(id SERIAL PRIMARY KEY,
city TEXT NOT NULL
);

CREATE TABLE countries
(id SERIAL PRIMARY KEY,
country TEXT NOT NULL
);

CREATE TABLE cities_tickets
(id SERIAL PRIMARY KEY,
to_city_id INTEGER REFERENCES cities,
from_city_id INTEGER REFERENCES cities
);

CREATE TABLE countries_tickets
(id SERIAL PRIMARY KEY,
to_country_id INTEGER REFERENCES countries,
from_country_id INTEGER REFERENCES countries
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  departure_time TIMESTAMP NOT NULL,
  arrival_time TIMESTAMP NOT NULL,
  airline_id INT NOT NULL REFERENCES airlines,
  cities_id INT NOT NULL REFERENCES cities_tickets,
  countries_id INT NOT NULL REFERENCES countries_tickets,
  passenger_id INT NOT NULL REFERENCES passengers ON DELETE CASCADE
);

INSERT INTO airlines (company)
VALUES
('United'),('British Airways'), ('Delta'),('Air Canada'),('American Airlines');

INSERT INTO passengers (first_name,last_name)
VALUES
('John','Smith'), ('Thadeus', 'Gathercoal'),('Sonja', 'Pauley'),('Berkie', 'Wycliff'), ('Cory', 'Squibbes');

INSERT INTO cities (city)
VALUES
('Ottawa'), ('Toronto'),('Vancouver'), ('New York'), ('Baghdad'), ('Paris');

INSERT INTO countries (country)
VALUES
('Canada'), ('USA'), ('Afghanistan'), ('France');

INSERT INTO cities_tickets (to_city_id, from_city_id)
VALUES
(1,2),(1,6),(5,6);

INSERT INTO countries_tickets (to_country_id, from_country_id)
VALUES
(1,1), (1,4),(3,4);

INSERT INTO tickets (seat,departure_time,arrival_time,airline_id,cities_id,countries_id,passenger_id)
VALUES
('6A','2018-04-08 09:00:00', '2018-04-08 12:00:00',1,1,1,1),
('6B','2018-12-19 12:45:00', '2018-12-19 16:15:00',2,2,2,2),
('6C', '2018-01-02 07:00:00', '2018-01-02 08:03:00',3,3,3,3);


-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');