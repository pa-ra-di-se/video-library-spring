--liquibase formatted sql

--changeset paradise:1
CREATE TABLE IF NOT EXISTS revision
(
    id        SERIAL PRIMARY KEY,
    timestamp BIGINT NOT NULL
);

--changeset paradise:2
CREATE TABLE IF NOT EXISTS users_aud
(
    id          BIGINT NOT NULL,
    rev         INT    NOT NULL REFERENCES revision (id),
    revtype     SMALLINT,
    firstname   VARCHAR(128),
    lastname    VARCHAR(128),
    email       VARCHAR(64),
    password    VARCHAR(128),
    role        VARCHAR(32),
    created_at  TIMESTAMP,
    modified_at TIMESTAMP,
    created_by  VARCHAR(64),
    modified_by VARCHAR(64),
    PRIMARY KEY (id, rev)
);

--changeset paradise:3
CREATE TABLE IF NOT EXISTS review_aud
(
    id          BIGINT NOT NULL,
    rev         INT    NOT NULL REFERENCES revision (id),
    revtype     SMALLINT,
    movie_id    BIGINT,
    user_id     BIGINT,
    content     TEXT,
    grade       INT,
    created_at  TIMESTAMP,
    modified_at TIMESTAMP,
    created_by  VARCHAR(64),
    modified_by VARCHAR(64),
    PRIMARY KEY (id, rev)
);

--changeset paradise:4
CREATE TABLE IF NOT EXISTS profession_aud
(
    id          INT NOT NULL,
    rev         INT NOT NULL REFERENCES revision (id),
    revtype     SMALLINT,
    profession  VARCHAR(32),
    created_at  TIMESTAMP,
    modified_at TIMESTAMP,
    created_by  VARCHAR(64),
    modified_by VARCHAR(64),
    PRIMARY KEY (id, rev)
);

--changeset paradise:5
CREATE TABLE IF NOT EXISTS movie_aud
(
    id          BIGINT NOT NULL,
    rev         INT    NOT NULL REFERENCES revision (id),
    revtype     SMALLINT,
    title       VARCHAR(128),
    release     DATE,
    country     VARCHAR(64),
    genre       VARCHAR(64),
    created_at  TIMESTAMP,
    modified_at TIMESTAMP,
    created_by  VARCHAR(64),
    modified_by VARCHAR(64),
    PRIMARY KEY (id, rev)
);

--changeset paradise:6
CREATE TABLE IF NOT EXISTS filmmaker_aud
(
    id          BIGINT NOT NULL,
    rev         INT    NOT NULL REFERENCES revision (id),
    revtype     SMALLINT,
    firstname   VARCHAR(128),
    lastname    VARCHAR(128),
    birthday    DATE,
    created_at  TIMESTAMP,
    modified_at TIMESTAMP,
    created_by  VARCHAR(64),
    modified_by VARCHAR(64),
    PRIMARY KEY (id, rev)
);

--changeset paradise:7
CREATE TABLE IF NOT EXISTS filmmaker_movie_aud
(
    id           BIGINT NOT NULL,
    rev          INT    NOT NULL REFERENCES revision (id),
    revtype      SMALLINT,
    movie_id     BIGINT,
    filmmaker_id BIGINT,
    created_at   TIMESTAMP,
    modified_at  TIMESTAMP,
    created_by   VARCHAR(64),
    modified_by  VARCHAR(64),
    PRIMARY KEY (id, rev)
);

--changeset paradise:8
CREATE TABLE IF NOT EXISTS filmmaker_profession_aud
(
    id            BIGINT NOT NULL,
    rev           INT    NOT NULL REFERENCES revision (id),
    revtype       SMALLINT,
    filmmaker_id  BIGINT,
    profession_id INT,
    created_at    TIMESTAMP,
    modified_at   TIMESTAMP,
    created_by    VARCHAR(64),
    modified_by   VARCHAR(64),
    PRIMARY KEY (id, rev)
);
