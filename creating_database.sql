
DROP DATABASE IF EXISTS `MovieDB`;
CREATE DATABASE MovieDB;
USE MovieDB;

CREATE TABLE directors (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    birthdate DATE NOT NULL,
    nationality VARCHAR(255) NOT NULL
);


CREATE TABLE movies (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title VARCHAR(255) NOT NULL,
    year DATE NOT NULL,
    rating DECIMAL(2, 1) NOT NULL,
    country VARCHAR(255) DEFAULT NULL,
    poster VARCHAR(255) DEFAULT NULL,
    director_id INT NOT NULL,
    FOREIGN KEY (director_id) REFERENCES directors(id)
);


CREATE TABLE genres (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE actors (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    birthdate DATE NOT NULL,
    nationality VARCHAR(255) NOT NULL
);


CREATE TABLE movie_genres (
    movie_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES movies(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);


CREATE TABLE movie_actors (
    movie_id INT NOT NULL,
    actor_id INT NOT NULL,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(id),
    FOREIGN KEY (actor_id) REFERENCES actors(id)
);


INSERT INTO directors (name, birthdate, nationality) VALUES
('Christopher Nolan', '1970-07-30', 'British-American'),
('Quentin Tarantino', '1963-03-27', 'American'),
('Steven Spielberg', '1946-12-18', 'American');


INSERT INTO movies (title, year, rating, country, poster, director_id) VALUES
('Inception', '2010-07-16', 8.8, 'USA', NULL, 1),
('Django Unchained', '2012-12-25', 8.4, 'USA', NULL, 2),
('Jurassic Park', '1993-06-11', 8.2, 'USA', NULL, 3);


INSERT INTO genres (name) VALUES
('Action'),
('Adventure'),
('Sci-Fi'),
('Drama'),
('Thriller');


INSERT INTO actors (name, birthdate, nationality) VALUES
('Leonardo DiCaprio', '1974-11-11', 'American'),
('Jamie Foxx', '1967-12-13', 'American'),
('Sam Neill', '1947-09-14', 'New Zealander');


INSERT INTO movie_genres (movie_id, genre_id) VALUES
(1, 1), -- Inception -> Action
(1, 3), -- Inception -> Sci-Fi
(2, 4), -- Django Unchained -> Drama
(2, 5), -- Django Unchained -> Thriller
(3, 2), -- Jurassic Park -> Adventure
(3, 3); -- Jurassic Park -> Sci-Fi


INSERT INTO movie_actors (movie_id, actor_id) VALUES
(1, 1), -- Inception -> Leonardo DiCaprio
(2, 2), -- Django Unchained -> Jamie Foxx
(3, 3); -- Jurassic Park -> Sam Neill

