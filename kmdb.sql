.mode column
.headers off

-- drop tables so we can start fresh
DROP TABLE IF EXISTS performances;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS studios;
DROP TABLE IF EXISTS agents;

-- make the tables

CREATE TABLE studios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);

CREATE TABLE agents (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);

-- actors belong to an agent
CREATE TABLE actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  agent_id INTEGER
);

-- movies belong to a studio
CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year_released INTEGER,
  rated TEXT,
  studio_id INTEGER
);

-- this connects actors and movies
CREATE TABLE performances (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_id INTEGER,
  actor_id INTEGER,
  character_name TEXT
);

-- add data

INSERT INTO studios (name) VALUES ("Warner Bros.");

INSERT INTO agents (name) VALUES ("Jane Smith");

-- actors (no agent yet)
INSERT INTO actors (name, agent_id) VALUES ("Christian Bale", null);
INSERT INTO actors (name, agent_id) VALUES ("Michael Caine", null);
INSERT INTO actors (name, agent_id) VALUES ("Liam Neeson", null);
INSERT INTO actors (name, agent_id) VALUES ("Katie Holmes", null);
INSERT INTO actors (name, agent_id) VALUES ("Gary Oldman", null);
INSERT INTO actors (name, agent_id) VALUES ("Heath Ledger", null);
INSERT INTO actors (name, agent_id) VALUES ("Aaron Eckhart", null);
INSERT INTO actors (name, agent_id) VALUES ("Maggie Gyllenhaal", null);
INSERT INTO actors (name, agent_id) VALUES ("Tom Hardy", null);
INSERT INTO actors (name, agent_id) VALUES ("Joseph Gordon-Levitt", null);
INSERT INTO actors (name, agent_id) VALUES ("Anne Hathaway", null);

-- movies (warner bros is studio id 1)
INSERT INTO movies (title, year_released, rated, studio_id) VALUES ("Batman Begins", 2005, "PG-13", 1);
INSERT INTO movies (title, year_released, rated, studio_id) VALUES ("The Dark Knight", 2008, "PG-13", 1);
INSERT INTO movies (title, year_released, rated, studio_id) VALUES ("The Dark Knight Rises", 2012, "PG-13", 1);

-- batman begins is movie id 1
INSERT INTO performances (movie_id, actor_id, character_name) VALUES (1, 1, "Bruce Wayne");
INSERT INTO performances (movie_id, actor_id, character_name) VALUES (1, 2, "Alfred");
INSERT INTO performances (movie_id, actor_id, character_name) VALUES (1, 3, "Ra's Al Ghul");
INSERT INTO performances (movie_id, actor_id, character_name) VALUES (1, 4, "Rachel Dawes");
INSERT INTO performances (movie_id, actor_id, character_name) VALUES (1, 5, "Commissioner Gordon");

-- the dark knight is movie id 2
INSERT INTO performances (movie_id, actor_id, character_name) VALUES (2, 1, "Bruce Wayne");
INSERT INTO performances (movie_id, actor_id, character_name) VALUES (2, 6, "Joker");
INSERT INTO performances (movie_id, actor_id, character_name) VALUES (2, 7, "Harvey Dent");
INSERT INTO performances (movie_id, actor_id, character_name) VALUES (2, 2, "Alfred");
INSERT INTO performances (movie_id, actor_id, character_name) VALUES (2, 8, "Rachel Dawes");

-- the dark knight rises is movie id 3
INSERT INTO performances (movie_id, actor_id, character_name) VALUES (3, 1, "Bruce Wayne");
INSERT INTO performances (movie_id, actor_id, character_name) VALUES (3, 5, "Commissioner Gordon");
INSERT INTO performances (movie_id, actor_id, character_name) VALUES (3, 9, "Bane");
INSERT INTO performances (movie_id, actor_id, character_name) VALUES (3, 10, "John Blake");
INSERT INTO performances (movie_id, actor_id, character_name) VALUES (3, 11, "Selina Kyle");

-- assign agent to christian bale
UPDATE actors SET agent_id = 1 WHERE id = 1;

.print "Movies"
.print "======"
.print ""

SELECT movies.title, movies.year_released, movies.rated, studios.name
FROM movies
JOIN studios ON movies.studio_id = studios.id;

.print ""
.print "Top Cast"
.print "========"
.print ""

SELECT movies.title, actors.name, performances.character_name
FROM performances
JOIN movies ON performances.movie_id = movies.id
JOIN actors ON performances.actor_id = actors.id;

.print ""
.print "Represented by agent"
.print "===================="
.print ""

SELECT actors.name
FROM actors
WHERE actors.agent_id = 1;