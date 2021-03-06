DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.artist (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.hire_plan (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `value` DOUBLE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.album (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    release_year INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(id)
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.song (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    album_id INT NOT NULL,
    duration INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(id)
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.`user` (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    hire_plan_id INT NOT NULL,
    hire_date DATETIME DEFAULT NOW(),
    FOREIGN KEY (hire_plan_id) REFERENCES SpotifyClone.hire_plan(id)
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.history (
    song_id INT NOT NULL,
    last_heard DATETIME DEFAULT NOW(),
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.`user`(id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(id),
    FOREIGN KEY (song_id) REFERENCES SpotifyClone.song(id)
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.following_artists (
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.`user`(id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(id)
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.artist (`name`)
VALUES ('Walter Phoenix'),
	('Freedie Shannon'),
    ('Lance Day'),
    ('Tyler Isle'),
    ('Fog'),
    ('Peter Strong');
    
INSERT INTO SpotifyClone.hire_plan (`name`, `value`)
VALUES ('gratuito', 0),
	('familiar', 7.99),
    ('universitario', 5.99),
    ('pessoal', 6.99);
    
INSERT INTO SpotifyClone.album (`name`, artist_id, release_year)
VALUES ('Envious', 1, 1990),
	('Exuberant', 1, 1993),
    ('Hallowed Steam', 6, 1995),
    ('Incandescent', 3, 1998),
    ('Temporary Culture', 2, 2001),
    ('Library of liberty', 2, 2003),
    ('Chained Down', 4, 2007),
    ('Cabinet of fools', 4, 2012),
    ('No guarantees', 4, 2015),
    ('Apparatus', 5, 2015);
    
INSERT INTO SpotifyClone.song (`name`, album_id, duration)
VALUES ('Soul For Us', 1, 200),
	('Reflections Of Magic', 1, 163),
    ('Dance With Her Own', 1, 116),
    ('Troubles Of My Inner Fire', 2, 203),
    ('Time Fireworks', 2, 152),
    ('Magic Circus', 3, 105),
    ('Honey, So Do I', 3, 207),
    ('Sweetie, Let\'s Go Wild', 3, 139),
    ('She Knows', 3, 244),
    ('Fantasy For Me', 4, 100),
    ('Celebration Of More', 4, 146),
    ('Rock His Everything', 4, 223),
    ('Home Forever', 4, 231),
    ('Diamond Power', 4, 241),
    ('Let\'s Be Silly', 4, 132),
    ('Thang Of Thunder', 5, 240),
    ('Words Of Her Life', 5, 185),
    ('Without My Streets', 5, 176),
    ('Need Of The Evening', 6, 190),
    ('History Of My Roses', 6, 222),
    ('Without My Love', 6, 111),
    ('Walking And Game', 6, 123),
    ('Young And Father', 6, 197),
    ('Finding My Traditions', 7, 179),
    ('Walking And Man', 7, 229),
    ('Hard And Time', 7, 135),
    ('Honey, I\'m A Lone Wolf', 7, 150),
    ('She Thinks I Won\'t Stay Tonight', 8, 166),
    ('He Heard You\'re Bad For Me', 8, 154),
    ('He Hopes We Can\'t Stay', 8, 210),
    ('I Know I Know', 8, 117),
    ('He\'s Walking Away', 9, 159),
    ('He\'s Trouble', 9, 138),
    ('I Heard I Want To Bo Alone', 9, 120),
    ('I Ride Alone', 9, 151),
    ('Honey', 10, 79),
    ('You Cheated On Me', 10, 95),
    ('Wouldn\'t It Be Nice', 10, 213),
    ('Baby', 10, 136),
    ('You Make Me Feel So..', 10, 83);
    
INSERT INTO SpotifyClone.`user` (`name`, age, hire_plan_id, hire_date)
VALUES ('Thati', 23, 1, '2019-10-20 00:00:00'),
	('Cintia', 35, 2, '2017-12-30 00:00:00'),
    ('Bill', 20, 3, '2019-06-05 00:00:00'),
    ('Roger', 45, 4, '2020-08-13 00:00:00'),
    ('Norman', 58, 4, '2017-02-17 00:00:00'),
    ('Patrick', 33, 2, '2007-01-06 00:00:00'),
    ('Vivian', 26, 3, '2018-01-05 00:00:00'),
    ('Carol', 19, 3, '2018-02-14 00:00:00'),
    ('Angelina', 42, 2, '2018-04-29 00:00:00'),
    ('Paul', 46, 2, '2017-01-17 00:00:00');

INSERT INTO SpotifyClone.history (song_id, last_heard, user_id, artist_id)
VALUES (36, '2020-02-28 10:45:55', 1, 5),
	(25, "2020-05-02 05:30:35", 1, 4),
    (23, "2020-03-06 11:22:33", 1, 2),
    (14, "2020-08-05 08:05:17", 1, 3),
    (15, "2020-09-14 16:32:22", 1, 3),
	(34, "2020-01-02 07:40:33", 2, 4),
    (24, "2020-05-16 06:16:22", 2, 4),
    (21, "2020-10-09 12:27:48", 2, 2),
    (39, "2020-09-21 13:14:46", 2, 5),
    (6, "2020-11-13 16:55:13", 3, 6),
    (3, "2020-12-05 18:38:30", 3, 1),
    (26, "2020-07-30 10:00:00", 3, 4),
    (2, "2021-08-15 17:10:10", 4, 1),
    (35, "2021-07-10 15:20:30", 4, 4),
    (27, "2021-01-09 01:44:33", 4, 4),
    (7, "2020-07-03 19:33:28", 5, 6),
    (12, "2017-02-24 21:14:22", 5, 3),
    (14, "2020-08-06 15:23:43", 5, 3),
    (1, "2020-11-10 13:52:27", 5, 1),
    (38, "2019-02-07 20:33:48", 6, 5),
    (29, "2017-01-24 00:31:17", 6, 4),
    (30, "2017-10-12 12:35:20", 6, 4),
    (22, "2018-05-29 14:56:41", 6, 2),
    (5, "2018-05-09 22:30:49", 7, 1),
    (4, "2020-07-27 12:52:58", 7, 1),
    (11, "2018-01-16 18:40:43", 7, 3),
    (39, "2018-03-21 16:56:40", 8, 5),
    (40, "2020-10-18 13:38:05", 8, 5),
    (32, "2019-05-25 08:14:03", 8, 4),
    (33, "2021-08-15 21:37:09", 8, 4),
    (16, "2021-05-24 17:23:45", 9, 2),
    (17, "2018-12-07 22:48:52", 9, 2),
    (8, "2021-03-14 06:14:26", 9, 6),
    (9, "2020-04-01 03:36:00", 9, 6),
    (20, "2017-02-06 08:21:34", 10, 2),
    (21, "2017-12-04 05:33:43", 10, 2),
    (12, "2017-07-27 05:24:49", 10, 3),
    (13, "2017-12-25 01:03:57", 10, 3);
    
INSERT INTO SpotifyClone.following_artists (user_id, artist_id)
VALUES (1, 1),
	(1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 6),
    (3, 1),
    (4, 2),
    (5, 4),
    (5, 5),
    (6, 5),
    (6, 3),
    (6, 1),
    (7, 6),
    (7, 4),
    (8, 1),
    (8, 4),
    (9, 5),
    (9, 2),
    (9, 3),
    (10, 6),
    (10, 5);
    