
DROP SCHEMA IF EXISTS all_bar_db;
CREATE SCHEMA all_bar_db;
USE all_bar_db;

DROP TABLE IF EXISTS bars;

CREATE TABLE bars (
    id VARCHAR(255) UNIQUE NOT NULL,
    lon VARCHAR(255),
    lat VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    opening_hours VARCHAR(255) NULL,
    PRIMARY KEY (id)
);

