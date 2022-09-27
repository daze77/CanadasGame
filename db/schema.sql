DROP DATABASE IF EXISTS hockey_db;

CREATE DATABASE hockey_db;

USE hockey_db;

-- USE mySQLdb;

CREATE TABLE team (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR (100) NOT NULL
);

CREATE TABLE coach (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR (100) NOT NULL,
    last_name VARCHAR (100) NOT NULL,
    team_id INT NOT NULL,
    INDEX team_ind( team_id ),
    CONSTRAINT fk_team FOREIGN KEY ( team_id ) REFERENCES team(id) ON DELETE CASCADE
);

CREATE TABLE player (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR (100) NOT NULL,
    last_name VARCHAR (100) NOT NULL,
    birth_date VARCHAR (20) NOT NULL,
    email VARCHAR (100) NOT NULL,
    street VARCHAR (100) NOT NULL,
    city VARCHAR (100) NOT NULL,
    province VARCHAR (10) NOT NULL,
    postal_code VARCHAR (7) NOT NULL,
    friend_first_name VARCHAR (100),
    friend_last_name VARCHAR (100),
    position VARCHAR (100) NOT NULL,
    experience_level VARCHAR (100) NOT NULL,
    coach_id INT,
    fieldname VARCHAR (100),
    originalname VARCHAR (100),
    encoding VARCHAR (100),
    mimetype VARCHAR (100),
    destination VARCHAR (100),
    filename VARCHAR (100),
    path varchar(100),
    INDEX player_ind( coach_id ),
    CONSTRAINT fk_coach FOREIGN KEY ( coach_id ) REFERENCES coach(id) ON DELETE CASCADE,
    friend_id INT UNSIGNED,
    INDEX friend_ind( friend_id )
    -- CONSTRAINT fk_friend FOREIGN KEY ( friend_id ) REFERENCES player(id) ON DELETE SET NULL
);