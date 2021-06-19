DROP SCHEMA IF EXISTS filtered_bar_db;
CREATE SCHEMA filtered_bar_db;
USE filtered_bar_db;

DROP TABLE IF EXISTS filtered_bars;

CREATE TABLE filtered_bars (
    id VARCHAR(255) UNIQUE NOT NULL,
    lon VARCHAR(255),
    lat VARCHAR(255),
    name VARCHAR(255),
    website VARCHAR(255),
    phone VARCHAR(255),
    opening_hours VARCHAR(255),
    PRIMARY KEY (id)
);
