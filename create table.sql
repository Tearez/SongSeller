DROP DATABASE IF EXISTS song_seller;
CREATE DATABASE song_seller;

USE song_seller;

CREATE TABLE groups (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(150)
);

CREATE TABLE artists (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(150) NOT NULL,
age INT NOT NULL,
address VARCHAR(150) NOT NULL,
group_id INT,
CONSTRAINT FOREIGN KEY (group_id) REFERENCES groups(id)
);


CREATE TABLE composers (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(150) NOT NULL,
age INT NOT NULL,
address VARCHAR(150)
);

CREATE TABLE songs (
id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(200) NOT NULL,
duration INT NOT NULL
);

CREATE TABLE song_info (
group_id INT,
song_id INT,
composer_id INT,
CONSTRAINT FOREIGN KEY (group_id) REFERENCES groups(id),
CONSTRAINT FOREIGN KEY (song_id) REFERENCES songs(id),
CONSTRAINT FOREIGN KEY (composer_id) REFERENCES composers(id),
CONSTRAINT PK_person_song_composer PRIMARY KEY (group_id, song_id, composer_id)
);

CREATE TABLE arrangements (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE song_arrangement (
song_id INT,
arrangement_id INT,
CONSTRAINT FOREIGN KEY (song_id) REFERENCES songs(id),
CONSTRAINT FOREIGN KEY (arrangement_id) REFERENCES arrangements(id)
);

CREATE TABLE genres (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE song_genre (
song_id INT,
genre_id INT,
CONSTRAINT FOREIGN KEY (song_id) REFERENCES songs(id),
CONSTRAINT FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE styles (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE song_style (
song_id INT,
style_id INT,
CONSTRAINT FOREIGN KEY (song_id) REFERENCES songs(id),
CONSTRAINT FOREIGN KEY (style_id) REFERENCES styles(id)
);

/* инсерт заявки за групи*/
INSERT INTO groups (name) values ('50 Cent'); -- ID = 1
INSERT INTO groups (name) values ('The White Stripes'); -- ID = 2
INSERT INTO groups (name) values ('Arctic Monkeys'); -- ID = 3

/* инсерт заявки за композитори*/
insert into	composers (name, age, address) values('Lars Winther', 38, 'Lars Winther address');-- ID = 1
insert into	composers (name, age, address) values('Jack White', 42, 'Jack White address');-- ID = 2
insert into	composers (name, age, address) values('Alex Turner', 32, 'Alex Turner address');-- ID = 3

/* инсерт заявки за артисти*/
insert into artists (name, age, address, group_id) values('50 Cent', 42, '50 Cent address', 1); -- ID = 1

insert into artists (name, age, address, group_id) values('Jack White', 42, 'Jack White address', 1); -- ID = 2
insert into artists (name, age, address, group_id) values('Meg White', 43, 'Meg White address', 2); -- ID = 3


insert into artists (name, age, address, group_id) values('Alex Turner', 32, 'Alex Turner address', 3); -- ID = 4
insert into artists (name, age, address, group_id) values('Matt Helders', 32, 'Matt Helders address', 3); -- ID = 5
insert into artists (name, age, address, group_id) values('Jamie Cook', 32, 'Jamie Cook address', 3); -- ID = 6
insert into artists (name, age, address, group_id) values('Nick O\'Malley', 32, 'Nick O\'Malley address', 3); -- ID = 7

/*инсерт заявки за песни*/
INSERT INTO songs (title, duration) VALUES ('Pilot', 182); -- ID = 1
INSERT INTO songs (title, duration) VALUES ('Animal Ambition', 200); -- ID = 2
INSERT INTO songs (title, duration) VALUES ('Seven Nation Army', 240); -- ID = 3
INSERT INTO songs (title, duration) VALUES ('My Propeller', 207); -- ID = 4
INSERT INTO songs (title, duration) VALUES ('Suck It and See', 226); -- ID = 5
INSERT INTO songs (title, duration) VALUES ('Do I Wanna Know?', 272); -- ID = 6

/* INSERT заявки за добавяне на аранжименти */
INSERT INTO arrangements (name) VALUES ('Electronic'); -- ID = 1
INSERT INTO arrangements (name) VALUES ('Jazz'); -- ID = 2
INSERT INTO arrangements (name) VALUES ('Rock'); -- ID = 3

/* INSERT заявки за добавяне на жанрове */
INSERT INTO genres (name) VALUES ('Hip-Hop'); -- ID = 1
INSERT INTO genres (name) VALUES('Pop'); -- ID = 2
INSERT INTO genres (name) VALUES ('Rock'); -- ID = 3

/* INSERT заявки за добавяне на стилове */
INSERT INTO styles (name) VALUES ('Dance'); -- ID = 1
INSERT INTO styles (name) VALUES('Sad'); -- ID = 2
INSERT INTO styles (name) VALUES('Funky'); -- ID = 3
INSERT INTO styles (name) VALUES('Deep'); -- ID = 4

/* INSERT заявки за свърване на песен към даден изпълнител и композитор */
INSERT INTO song_info VALUES (1, 1, 1);
INSERT INTO song_info VALUES (1, 2, 1);
INSERT INTO song_info VALUES (2, 3, 2);
INSERT INTO song_info VALUES (3, 4, 3);
INSERT INTO song_info VALUES (3, 5, 3);
INSERT INTO song_info VALUES (3, 6, 3);

/* INSERT заявки за свързване на песен към даден жанр */
INSERT INTO song_genre VALUES (1, 1);
INSERT INTO song_genre VALUES (2, 1);
INSERT INTO song_genre VALUES (3, 2);
INSERT INTO song_genre VALUES (4, 3);
INSERT INTO song_genre VALUES (5, 3);
INSERT INTO song_genre VALUES (6, 3);

/* INSERT заявки за свързване на песен към даден стил */
INSERT INTO song_style VALUES (1, 1);
INSERT INTO song_style VALUES (2, 1);
INSERT INTO song_style VALUES (3, 3);
INSERT INTO song_style VALUES (4, 4);
INSERT INTO song_style VALUES (5, 1);
INSERT INTO song_style VALUES (6, 2);
