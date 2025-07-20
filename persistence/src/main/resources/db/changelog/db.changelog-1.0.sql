--liquibase formatted sql

--changeset paradise:1
CREATE TABLE IF NOT EXISTS movie
(
    id      BIGSERIAL PRIMARY KEY,
    title   VARCHAR(128) NOT NULL UNIQUE,
    release DATE         NOT NULL,
    country VARCHAR(64)  NOT NULL,
    genre   VARCHAR(64)  NOT NULL,
    created_at  TIMESTAMP,
    modified_at TIMESTAMP,
    created_by  VARCHAR(64),
    modified_by VARCHAR(64)
);

--changeset paradise:2
CREATE TABLE IF NOT EXISTS filmmaker
(
    id        BIGSERIAL PRIMARY KEY,
    firstname VARCHAR(128) NOT NULL,
    lastname  VARCHAR(128) NOT NULL,
    birthday  DATE         NOT NULL,
    created_at  TIMESTAMP,
    modified_at TIMESTAMP,
    created_by  VARCHAR(64),
    modified_by VARCHAR(64),
    UNIQUE (firstname, lastname, birthday)
);

--changeset paradise:3
CREATE TABLE IF NOT EXISTS profession
(
    id         SERIAL PRIMARY KEY,
    profession VARCHAR(32) NOT NULL UNIQUE,
    created_at  TIMESTAMP,
    modified_at TIMESTAMP,
    created_by  VARCHAR(64),
    modified_by VARCHAR(64)
);

--changeset paradise:4
CREATE TABLE IF NOT EXISTS filmmaker_profession
(
    id            BIGSERIAL PRIMARY KEY,
    filmmaker_id  BIGINT NOT NULL REFERENCES filmmaker (id) ON DELETE CASCADE,
    profession_id INT    NOT NULL REFERENCES profession (id) ON DELETE CASCADE,
    created_at  TIMESTAMP,
    modified_at TIMESTAMP,
    created_by  VARCHAR(64),
    modified_by VARCHAR(64),
    UNIQUE (filmmaker_id, profession_id)
);

--changeset paradise:5
CREATE TABLE IF NOT EXISTS filmmaker_movie
(
    id           BIGSERIAL PRIMARY KEY,
    movie_id     BIGINT NOT NULL REFERENCES movie (id) ON DELETE CASCADE,
    filmmaker_id BIGINT NOT NULL REFERENCES filmmaker (id) ON DELETE CASCADE,
    created_at  TIMESTAMP,
    modified_at TIMESTAMP,
    created_by  VARCHAR(64),
    modified_by VARCHAR(64)
);

--changeset paradise:6
CREATE TABLE IF NOT EXISTS users
(
    id        BIGSERIAL PRIMARY KEY,
    firstname VARCHAR(128) NOT NULL,
    lastname  VARCHAR(128) NOT NULL,
    email     VARCHAR(64)  NOT NULL UNIQUE,
    password  VARCHAR(128) NOT NULL,
    role      VARCHAR(32) DEFAULT 'USER',
    created_at  TIMESTAMP,
    modified_at TIMESTAMP,
    created_by  VARCHAR(64),
    modified_by VARCHAR(64)
);

--changeset paradise:7
CREATE TABLE IF NOT EXISTS review
(
    id       BIGSERIAL PRIMARY KEY,
    movie_id BIGINT  NOT NULL REFERENCES movie (id) ON DELETE CASCADE,
    user_id  BIGINT  NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    content  TEXT    NOT NULL,
    grade    INTEGER NOT NULL
        CONSTRAINT review_grade_check
            CHECK ((grade >= 0) AND (grade <= 10)),
    created_at  TIMESTAMP,
    modified_at TIMESTAMP,
    created_by  VARCHAR(64),
    modified_by VARCHAR(64),
    UNIQUE (movie_id, user_id, content)
);
