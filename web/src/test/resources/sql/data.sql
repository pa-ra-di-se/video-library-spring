INSERT INTO movie (id, title, release, country, genre)
VALUES (1, 'The Great Escape', '1963-07-04', 'USA', 'Adventure'),
       (2, 'Inception', '2010-07-16', 'USA', 'Sci-Fi'),
       (3, 'Parasite', '2019-05-30', 'South Korea', 'Thriller'),
       (4, 'The Godfather', '1972-03-24', 'USA', 'Crime'),
       (5, 'Spirited Away', '2001-07-20', 'Japan', 'Animation'),
       (6, 'Pulp Fiction', '1994-10-14', 'USA', 'Crime'),
       (7, 'The Dark Knight', '2008-07-18', 'USA', 'Action'),
       (8, 'Amélie', '2001-04-25', 'France', 'Romantic Comedy'),
       (9, 'Interstellar', '2014-11-07', 'USA', 'Sci-Fi'),
       (10, 'City of God', '2002-08-31', 'Brazil', 'Crime'),
       (11, 'The Matrix', '1999-03-31', 'USA', 'Sci-Fi'),
       (12, 'Gladiator', '2000-05-05', 'USA', 'Action'),
       (13, 'The Lion King', '1994-06-24', 'USA', 'Animation'),
       (14, 'Whiplash', '2014-10-10', 'USA', 'Drama'),
       (15, 'La La Land', '2016-12-09', 'USA', 'Musical'),
       (16, 'The Shawshank Redemption', '1994-09-23', 'USA', 'Drama'),
       (17, 'Fight Club', '1999-10-15', 'USA', 'Drama'),
       (18, 'The Social Network', '2010-10-01', 'USA', 'Drama'),
       (19, 'Oldboy', '2003-11-21', 'South Korea', 'Thriller'),
       (20, 'The Grand Budapest Hotel', '2014-03-28', 'USA', 'Comedy'),
       (21, 'Mad Max: Fury Road', '2015-05-15', 'Australia', 'Action'),
       (22, 'The Prestige', '2006-10-20', 'USA', 'Drama'),
       (23, 'Django Unchained', '2012-12-25', 'USA', 'Western'),
       (24, 'Her', '2013-12-18', 'USA', 'Romance'),
       (25, 'The Departed', '2006-10-06', 'USA', 'Crime'),
       (26, 'Coco', '2017-11-22', 'USA', 'Animation'),
       (27, 'Blade Runner 2049', '2017-10-06', 'USA', 'Sci-Fi'),
       (28, 'The Revenant', '2015-12-25', 'USA', 'Adventure'),
       (29, 'Joker', '2019-10-04', 'USA', 'Drama'),
       (30, 'Avengers: Endgame', '2019-04-26', 'USA', 'Action');
SELECT SETVAL('movie_id_seq', (SELECT MAX(id) FROM movie));

INSERT INTO filmmaker (id, firstname, lastname, birthday)
VALUES (1, 'Steven', 'Spielberg', '1946-12-18'),
       (2, 'Christopher', 'Nolan', '1970-07-30'),
       (3, 'Quentin', 'Tarantino', '1963-03-27'),
       (4, 'Martin', 'Scorsese', '1942-11-17'),
       (5, 'Hayao', 'Miyazaki', '1941-01-05'),
       (6, 'Bong', 'Joon-ho', '1969-09-14'),
       (7, 'Wes', 'Anderson', '1969-05-01'),
       (8, 'Ridley', 'Scott', '1937-11-30'),
       (9, 'James', 'Cameron', '1954-08-16'),
       (10, 'Peter', 'Jackson', '1961-10-31'),
       (11, 'David', 'Fincher', '1962-08-28'),
       (12, 'Denis', 'Villeneuve', '1967-10-03'),
       (13, 'Guillermo', 'del Toro', '1964-10-09'),
       (14, 'Stanley', 'Kubrick', '1928-07-26'),
       (15, 'Alfonso', 'Cuarón', '1961-11-28'),
       (16, 'Joel', 'Coen', '1954-11-29'),
       (17, 'Ethan', 'Coen', '1957-09-21'),
       (18, 'Spike', 'Lee', '1957-03-20'),
       (19, 'Ang', 'Lee', '1954-10-23'),
       (20, 'James', 'Wan', '1977-02-26'),
       (21, 'Greta', 'Gerwig', '1983-08-04'),
       (22, 'Denis', 'Diderot', '1713-10-05'),
       (23, 'Sofia', 'Coppola', '1971-05-14'),
       (24, 'Richard', 'Linklater', '1960-07-30'),
       (25, 'Taika', 'Waititi', '1975-08-16'),
       (26, 'Mel', 'Gibson', '1956-01-03'),
       (27, 'Kathryn', 'Bigelow', '1951-11-27'),
       (28, 'Robert', 'Zemeckis', '1952-05-14'),
       (29, 'Ridley', 'Scott', '1937-11-30'),
       (30, 'James', 'Gray', '1969-10-14');
SELECT SETVAL('filmmaker_id_seq', (SELECT MAX(id) FROM filmmaker));

INSERT INTO profession (id, profession)
VALUES (1, 'Director'),
       (2, 'Producer'),
       (3, 'Writer'),
       (4, 'Actor'),
       (5, 'Cinematographer'),
       (6, 'Editor'),
       (7, 'Composer');
SELECT SETVAL('profession_id_seq', (SELECT MAX(id) FROM profession));

INSERT INTO filmmaker_profession (id, filmmaker_id, profession_id)
VALUES (1, 1, 1),   -- Steven Spielberg - Director
       (2, 1, 2),   -- Steven Spielberg - Producer
       (3, 2, 1),   -- Christopher Nolan - Director
       (4, 2, 3),   -- Christopher Nolan - Writer
       (5, 3, 1),   -- Quentin Tarantino - Director
       (6, 3, 3),   -- Quentin Tarantino - Writer
       (7, 3, 4),   -- Quentin Tarantino - Actor
       (8, 4, 1),   -- Martin Scorsese - Director
       (9, 4, 2),   -- Martin Scorsese - Producer
       (10, 5, 1),  -- Hayao Miyazaki - Director
       (11, 5, 3),  -- Hayao Miyazaki - Writer
       (12, 6, 1),  -- Bong Joon-ho - Director
       (13, 6, 3),  -- Bong Joon-ho - Writer
       (14, 7, 1),  -- Wes Anderson - Director
       (15, 7, 3),  -- Wes Anderson - Writer
       (16, 8, 1),  -- Ridley Scott - Director
       (17, 8, 2),  -- Ridley Scott - Producer
       (18, 9, 1),  -- James Cameron - Director
       (19, 9, 2),  -- James Cameron - Producer
       (20, 10, 1), -- Peter Jackson - Director
       (21, 10, 2), -- Peter Jackson - Producer
       (22, 11, 1), -- David Fincher - Director
       (23, 11, 2), -- David Fincher - Producer
       (24, 12, 1), -- Denis Villeneuve - Director
       (25, 13, 1), -- Guillermo del Toro - Director
       (26, 14, 1), -- Stanley Kubrick - Director
       (27, 15, 1), -- Alfonso Cuarón - Director
       (28, 16, 1), -- Joel Coen - Director
       (29, 17, 1), -- Ethan Coen - Director
       (30, 18, 1), -- Spike Lee - Director
       (31, 19, 1), -- Ang Lee - Director
       (32, 20, 1), -- James Wan - Director
       (33, 21, 1), -- Greta Gerwig - Director
       (34, 22, 1), -- Denis Diderot - Director (условно)
       (35, 23, 1), -- Sofia Coppola - Director
       (36, 24, 1), -- Richard Linklater - Director
       (37, 25, 1), -- Taika Waititi - Director
       (38, 26, 1), -- Mel Gibson - Director
       (39, 27, 1), -- Kathryn Bigelow - Director
       (40, 28, 1), -- Robert Zemeckis - Director
       (41, 29, 2), -- Ridley Scott - Producer (дублируется, для примера)
       (42, 30, 1); -- James Gray - Director
SELECT SETVAL('filmmaker_profession_id_seq', (SELECT MAX(id) FROM filmmaker_profession));

INSERT INTO filmmaker_movie (id, movie_id, filmmaker_id)
VALUES (1, 1, 1),    -- The Great Escape - Spielberg
       (2, 2, 2),    -- Inception - Nolan
       (3, 3, 6),    -- Parasite - Bong Joon-ho
       (4, 4, 4),    -- The Godfather - Scorsese
       (5, 5, 5),    -- Spirited Away - Miyazaki
       (6, 6, 3),    -- Pulp Fiction - Tarantino
       (7, 7, 2),    -- The Dark Knight - Nolan
       (8, 8, 7),    -- Amélie - Wes Anderson
       (9, 9, 9),    -- Interstellar - James Cameron
       (10, 10, 10), -- City of God - Peter Jackson
       (11, 11, 11), -- The Matrix - David Fincher
       (12, 12, 12), -- Gladiator - Denis Villeneuve
       (13, 13, 13), -- The Lion King - Guillermo del Toro
       (14, 14, 14), -- Whiplash - Stanley Kubrick
       (15, 15, 15), -- La La Land - Alfonso Cuarón
       (16, 16, 16), -- The Shawshank Redemption - Joel Coen
       (17, 17, 17), -- Fight Club - Ethan Coen
       (18, 18, 18), -- The Social Network - Spike Lee
       (19, 19, 19), -- Oldboy - Ang Lee
       (20, 20, 7),  -- The Grand Budapest Hotel - Wes Anderson
       (21, 21, 20), -- Mad Max: Fury Road - James Wan
       (22, 22, 21), -- The Prestige - Greta Gerwig
       (23, 23, 3),  -- Django Unchained - Tarantino
       (24, 24, 22), -- Her - Denis Diderot
       (25, 25, 10), -- The Departed - Peter Jackson
       (26, 26, 13), -- Coco - Guillermo del Toro
       (27, 27, 11), -- Blade Runner 2049 - David Fincher
       (28, 28, 9),  -- The Revenant - James Cameron
       (29, 29, 30), -- Joker - James Gray
       (30, 30, 20), -- Avengers: Endgame - James Wan
       (31, 2, 3),   -- Inception - Tarantino (условно, например, актер)
       (32, 6, 4),   -- Pulp Fiction - Scorsese (условно, Producer)
       (33, 7, 16),  -- The Dark Knight - Joel Coen (условно)
       (34, 13, 15), -- The Lion King - Alfonso Cuarón (условно)
       (35, 15, 36), -- La La Land - Hans Zimmer (Composer, если добавить)
       (36, 18, 11), -- The Social Network - David Fincher
       (37, 21, 25), -- Mad Max: Fury Road - Taika Waititi (условно)
       (38, 23, 26), -- Django Unchained - Mel Gibson (условно)
       (39, 28, 27), -- The Revenant - Kathryn Bigelow (условно)
       (40, 30, 28), -- Avengers: Endgame - Robert Zemeckis (условно)
       (41, 5, 5),   -- Spirited Away - Miyazaki (Writer)
       (42, 3, 6),   -- Parasite - Bong Joon-ho (Writer)
       (43, 4, 18),  -- The Godfather - Spike Lee (условно)
       (44, 9, 9),   -- Interstellar - James Cameron (Producer)
       (45, 11, 29), -- The Matrix - Ridley Scott (Producer)
       (46, 14, 14), -- Whiplash - Stanley Kubrick (Director)
       (47, 16, 16), -- The Shawshank Redemption - Joel Coen (Director)
       (48, 19, 19), -- Oldboy - Ang Lee (Director)
       (49, 20, 7),  -- The Grand Budapest Hotel - Wes Anderson (Director)
       (50, 22, 21); -- The Prestige - Greta Gerwig (Director)
SELECT SETVAL('filmmaker_movie_id_seq', (SELECT MAX(id) FROM filmmaker_movie));

INSERT INTO users (id, firstname, lastname, email, password, role)
VALUES (1, 'Ivan', 'Ivanov', 'ivanov@example.com', 'hashedpassword1', 'USER'),
       (2, 'Petr', 'Petrov', 'petrov@example.com', 'hashedpassword2', 'USER'),
       (3, 'Anna', 'Sidorova', 'sidorova@example.com', 'hashedpassword3', 'USER'),
       (4, 'Olga', 'Smirnova', 'smirnova@example.com', 'hashedpassword4', 'USER'),
       (5, 'Sergey', 'Kuznetsov', 'kuznetsov@example.com', 'hashedpassword5', 'ADMIN');
SELECT SETVAL('users_id_seq', (SELECT MAX(id) FROM users));

INSERT INTO review (id, movie_id, user_id, content, grade)
VALUES (1, 1, 1, 'Amazing classic adventure!', 9),
       (2, 2, 2, 'Mind-bending and thrilling.', 10),
       (3, 3, 3, 'A masterpiece of modern cinema.', 10),
       (4, 4, 4, 'Classic crime drama.', 9),
       (5, 5, 5, 'Beautiful animation and story.', 8),
       (6, 6, 1, 'Unique style and storytelling.', 9),
       (7, 7, 2, 'Best superhero movie.', 10),
       (8, 8, 3, 'Charming and heartwarming.', 8),
       (9, 9, 4, 'Epic sci-fi journey.', 9),
       (10, 10, 5, 'Powerful and intense.', 8);
SELECT SETVAL('review_id_seq', (SELECT MAX(id) FROM review));