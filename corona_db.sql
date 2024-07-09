CREATE DATABASE cv_table;
USE cv_table;


CREATE TABLE corona_virus (
    Province VARCHAR(255),
    Country_Region VARCHAR(255),
    Latitude FLOAT,
    Longitude FLOAT,
    Date DATE,
    Confirmed INT,
    Deaths INT,
    Recovered INT
);

SELECT * FROM corona_virus;
# Q1.check null values.
SELECT * FROM corona_virus
WHERE province IS NULL OR
	'country/region' IS NULL OR
      latitude IS NULL OR
      longitude IS NULL OR
	  date IS NULL OR
	  confirmed IS NULL OR
	  deaths IS NULL OR
      recovered IS NULL;








# Q3.check total number of rows
SELECT COUNT(*) AS total_rows
FROM corona_virus;







# Q4.check what is start_date and end_date
SELECT
    MIN(date) AS start_date,
    MAX(date) AS end_date
FROM corona_virus;


# Q5. number of months present in dataset
SELECT 
      YEAR(date) AS year,
      COUNT(DISTINCT MONTH(date)) AS number_of_months
FROM corona_virus
GROUP BY YEAR(date);


# Q6.find monthly average for confirmed, deaths, recovered
SELECT
     MONTH(date) AS month,
     year(date) AS year,
     AVG(confirmed) AS confirmed_avg,
     AVG(deaths) AS deaths_avg,
     AVG(recovered) AS recovered_avg
FROM corona_virus
GROUP BY month, year;








# Q7.find most frequent value for confirmed, deaths, recovered each month
SELECT
     MONTH(date) AS month,
     YEAR (date) AS year,
     MAX(confirmed) AS most_frequent_confirmed,
	 MAX(deaths) AS most_frequent_deaths,
	 MAX(recovered) AS most_frequent_recovered
FROM corona_virus
GROUP BY MONTH(date),YEAR(date);









# Q8.find minimum values for confirmed, deaths, recovered per year
SELECT YEAR('date') AS year,
       MIN(Confirmed) AS Min_confirmed,
       MIN(deaths) AS Min_deaths,
       MIN(recovered) AS Min_recovered
 FROM corona_virus
 GROUP BY year;




# Q9.find maximum values of confirmed, deaths, recovered per year
SELECT YEAR('date') AS year,
       MAX(Confirmed) AS Min_confirmed,
       MAX(deaths) AS Min_deaths,
       MAX(recovered) AS Min_recovered
 FROM corona_virus
 GROUP BY year;



# Q10.the total number of case of confirmed, deaths, recovered each month
SELECT 
     MONTH(Date) AS Month,
     YEAR(date) AS year,
     SUM(Confirmed) AS total_confirmed,
     SUM(deaths) AS total_deaths,
     SUM(recovered) AS total_recovered
FROM corona_virus
GROUP BY MONTH,Year;




 # Q11.check how coronavius spread out with respect to confirmed case
 SELECT  
      SUM(confirmed) AS total_confirmed,
      AVG(confirmed) AS Average_confirmed,
      ROUND(VARIANCE(confirmed)) AS VAR_confirmed,
      ROUND(VARIANCE(confirmed)) AS standard_deviation
FROM corona_virus;
 

 

 
 # Q12.check how corona virus spread out with respect to death case per month
SELECT
     MONTH(Date) AS month,
     YEAR(Date) AS year,
     SUM(Deaths) AS Total_deaths,
     AVG(Deaths) AS avg_deaths,
     ROUND(VARIANCE(deaths)) AS VAR_Deaths,
     ROUND(STDDEV(Deaths)) AS Standard_deviation
FROM corona_virus
GROUP BY MONTH, Year;

 
 
 
 
 
 
 # Q13.check how coronavirus spread out with respect to recovered case
 SELECT
      SUM(recovered) AS total_reconvered,
      AVG(recovered) AS avg_reconvered,
      ROUND(VARIANCE(recovered)) AS VAR_recovered,
      ROUND(STDDEV(recovered)) AS standard_deviation
FROM corona_virus;
 

 
# Q14. find country having highest number of the confimed case
SELECT
     'Country/region',
     SUM(confirmed) AS total_confirmed
FROM corona_virus
GROUP BY 'Country/Region'
ORDER BY total_confirmed DESC
LIMIT 5;









# Q15. find country having lowest number of the death case
SELECT
     'Country/region',
     SUM(deaths) AS total_deaths
FROM corona_virus
GROUP BY 'Country/Region'
ORDER BY total_DEATHS ASC
LIMIT 5;


# Q16.find top 5 country having highest recovered case
SELECT
     'country/region',
     SUM(recovered) AS total_recovered
FROM corona_virus
GROUP BY 'country/region'
ORDER BY total_recovered DESC
LIMIT 5;












