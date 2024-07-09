create database ds_table;
use ds_table;


CREATE TABLE corona_virus (
    Province VARCHAR(255),
    Country_Region VARCHAR(255),
    Latitude DECIMAL(10, 8),
    Longitude DECIMAL(11, 8),
    Date DATE,
    Confirmed INT,
    Deaths INT,
    Recovered INT
);
SELECT* FROM corona_virus;













