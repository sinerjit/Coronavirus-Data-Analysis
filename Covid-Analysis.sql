SELECT *
FROM covid_deaths


--Correcting the data type of the date column in the table
ALTER TABLE covid_vaccinations
ALTER COLUMN date TYPE DATE USING TO_DATE(date, 'MM/DD/YYYY');


SELECT location, date, total_cases, new_cases, total_deaths, population
FROM covid_deaths
ORDER BY 1, 2


-- Looking at Total Cases vs Total Deaths
-- Shows Likelihood of dying if you contract covid in your country
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathRatio 
FROM covid_deaths
WHERE location ILIKE '%turkey%'
ORDER BY 1, 2


-- Looking at Total Cases vs Population
-- Shows what percentage of population got Covid
SELECT location, date, total_cases, population, (total_cases/population)*100 AS infected_population_ratio 
FROM covid_deaths
WHERE location ILIKE '%states%'
ORDER BY 1, 2


--Looking at Countries with Highest Infection Ratio compared to Population

SELECT location, population, MAX(total_cases) AS Highest_infection_count, MAX((total_cases/population))*100 AS infected_population_ratio 
FROM covid_deaths
-- WHERE location ILIKE '%states%'
WHERE total_cases IS NOT NULL AND population IS NOT NULL
GROUP BY location, population
ORDER BY infected_population_ratio DESC


--Showing Countries with Highest Death Count Population

SELECT location,  MAX(total_deaths) AS total_death_count 
FROM covid_deaths
-- WHERE location ILIKE '%states%'
WHERE total_deaths IS NOT NULL AND continent IS NOT NULL
GROUP BY location
ORDER BY total_death_count DESC


-- Showing Continent with Highest Death Count Population

SELECT continent,  MAX(total_deaths) AS total_death_count 
FROM covid_deaths
-- WHERE location ILIKE '%states%'
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY total_death_count DESC


-- Global Numbers

SELECT date, SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as death_ratio
FROM covid_deaths
--WHERE location ILIKE '%turkey%'
WHERE total_deaths IS NOT NULL AND continent IS NOT NULL
GROUP BY date
ORDER BY 1, 2


-- Looking at Total Population vs Vaccinations

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS  rolling_vaccinationed
FROM covid_deaths AS dea
JOIN covid_vaccinations AS vac
ON dea.location = vac.location and dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2, 3


-- CTE

WITH pop_vac AS
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_vaccinationed
FROM covid_deaths AS dea
JOIN covid_vaccinations AS vac
ON dea.location = vac.location and dea.date = vac.date
WHERE dea.continent IS NOT NULL

)
SELECT * , (rolling_vaccinationed/population)*100
FROM pop_vac;


-- TEMP

DROP TABLE IF EXISTS percent_population_vaccinated; 
CREATE TEMPORARY TABLE percent_population_vaccinated
(
continent varchar(255),
location varchar(255),
date timestamp,
population numeric,
new_vaccinations numeric,
rolling_vaccinationed numeric
);

INSERT INTO percent_population_vaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_vaccinationed
FROM covid_deaths AS dea
JOIN covid_vaccinations AS vac
ON dea.location = vac.location and dea.date = vac.date
WHERE dea.continent IS NOT NULL;

SELECT * , (rolling_vaccinationed/population)*100
FROM percent_population_vaccinated;


-- Creating View to store data for later visualizations

CREATE VIEW percent_population_vaccinated AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS  rolling_vaccinationed
FROM covid_deaths AS dea
JOIN covid_vaccinations AS vac
ON dea.location = vac.location and dea.date = vac.date
WHERE dea.continent IS NOT NULL

SELECT *
FROM percent_population_vaccinated;



