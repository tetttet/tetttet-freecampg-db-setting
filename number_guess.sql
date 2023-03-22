CREATE DATABASE number_guess;

USE number_guess;

CREATE TABLE game (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  target INT NOT NULL,
  guess_count INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY (name)
);

CREATE TABLE guess (
  id INT NOT NULL AUTO_INCREMENT,
  game_id INT NOT NULL,
  guess_value INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (game_id) REFERENCES game(id)
);

