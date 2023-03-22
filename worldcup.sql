-- Create the World Cup database
CREATE DATABASE worldcup;

-- Connect to the World Cup database
\c worldcup;

-- Create the teams table
CREATE TABLE teams (
  team_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  country VARCHAR(50) NOT NULL,
  coach VARCHAR(50) NOT NULL,
  stadium VARCHAR(50) NOT NULL,
  founded_year INT NOT NULL
);

-- Create the players table
CREATE TABLE players (
  player_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  nationality VARCHAR(50) NOT NULL,
  position VARCHAR(50) NOT NULL,
  team_id INT REFERENCES teams(team_id)
);

-- Create the matches table
CREATE TABLE matches (
  match_id SERIAL PRIMARY KEY,
  date DATE NOT NULL,
  location VARCHAR(50) NOT NULL,
  stadium VARCHAR(50) NOT NULL,
  home_team_id INT REFERENCES teams(team_id),
  away_team_id INT REFERENCES teams(team_id),
  home_team_score INT NOT NULL,
  away_team_score INT NOT NULL
);

-- Create the goals table
CREATE TABLE goals (
  goal_id SERIAL PRIMARY KEY,
  match_id INT REFERENCES matches(match_id),
  player_id INT REFERENCES players(player_id),
  team_id INT REFERENCES teams(team_id),
  time INT NOT NULL,
  is_penalty BOOLEAN NOT NULL
);

-- Create the bookings table
CREATE TABLE bookings (
  booking_id SERIAL PRIMARY KEY,
  match_id INT REFERENCES matches(match_id),
  player_id INT REFERENCES players(player_id),
  team_id INT REFERENCES teams(team_id),
  card_type VARCHAR(10) NOT NULL,
  time INT NOT NULL
);
