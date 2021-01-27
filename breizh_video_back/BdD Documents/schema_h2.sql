CREATE SCHEMA breizhvideo AUTHORIZATION SA;

USE breizhvideo;

CREATE TABLE village (
  id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  post_code VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE show (
  id INTEGER NOT NULL AUTO_INCREMENT,
  release_date date DEFAULT NULL,
  village_id INTEGER NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (village_id) REFERENCES village (id)
);

CREATE TABLE film (
  id INTEGER NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  release_year year DEFAULT NULL,
  length INTEGER DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE preference (
  id INTEGER NOT NULL,
  vote INTEGER DEFAULT NULL,
  film_id INTEGER NOT NULL,
  show_id INTEGER NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (film_id) REFERENCES film (id),
  FOREIGN KEY (show_id) REFERENCES show (id)
);

CREATE TABLE actor (
  id INTEGER NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE category (
  id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(25) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE film_actor (
  film_id INTEGER NOT NULL,
  actor_id INTEGER NOT NULL,
  PRIMARY KEY (film_id,actor_id),
  FOREIGN KEY (actor_id) REFERENCES actor (id),
  FOREIGN KEY (film_id) REFERENCES film (id)
);

CREATE TABLE film_category (
  film_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  PRIMARY KEY (film_id,category_id),
  FOREIGN KEY (category_id) REFERENCES category (id),
  FOREIGN KEY (film_id) REFERENCES film (id)
);
