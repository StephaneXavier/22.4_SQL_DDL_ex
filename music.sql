-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music;

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
  
);

CREATE TABLE artists
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
 
);

CREATE TABLE producers
(
    id SERIAL PRIMARY KEY,
    name_of TEXT NOT NULL
);

CREATE TABLE producers_songs
(
    id SERIAL PRIMARY KEY,
    song_id INT REFERENCES songs,
    producer_id INT REFERENCES producers
);

CREATE TABLE artists_songs
(
    id SERIAL PRIMARY KEY,
    song_id INT REFERENCES songs,
    artist_id INT REFERENCES artists
);



INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '04-15-1997',  'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '10-31-1975',  'A Night at the Opera' ),
  ('One Sweet Day', 282, '11-14-1995', 'Daydream' ),
  ('Shallow', 216, '09-27-2018',  'A Star Is Born'),
  ('How You Remind Me', 223, '08-21-2001', 'Silver Side Up' );

INSERT INTO artists  (first_name, last_name)
VALUES
('steve','jones'),('roy','fitzgeral'),('louis','armtsrong'); 

INSERT INTO producers (name_of)
VALUES
('{"Rick Parashar"}'),
('{"Walter Afanasieff"}'),
('{"Roy Thomas Baker"}'),
('{"Stephen Lironi"}');

INSERT INTO producers_songs (song_id,producer_id)
VALUES
(1,1),(2,2),(3,3),(1,1);

INSERT INTO artists_songs (song_id,artist_id)
VALUES
(1,1),(1,1),(2,2),(3,3)



