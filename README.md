# COVID-19 Data Analysis Project

This project is a Data Analyst portfolio project aimed at analyzing COVID-19 data.

## Analyses

You can find the SQL queries and Python code for the analyses conducted on COVID-19 death and vaccination data below:

- SQL Queries for Data Analysis
- Python Code for Data Transfer

## SQL Queries for Data Analysis

Below are the SQL queries conducted on COVID-19 death and vaccination data:

1. **Total Case and Death Statistics**
    - Data Tables: `covid_deaths`
    - SQL Query: Total Case and Death Statistics

2. **Country-specific Death Rates**
    - Data Tables: `covid_deaths`
    - SQL Query: Country-specific Death Rates

3. **Infection Ratios in Population by Country**
    - Data Tables: `covid_deaths`
    - SQL Query: Infection Ratios in Population by Country

4. **Countries with Highest Infection Ratios**
    - Data Tables: `covid_deaths`
    - SQL Query: Countries with Highest Infection Ratios

5. **Countries with Highest Death Counts**
    - Data Tables: `covid_deaths`
    - SQL Query: Countries with Highest Death Counts

6. **Continents with Highest Death Counts**
    - Data Tables: `covid_deaths`
    - SQL Query: [Continents with Highest Death Counts]

7. **Global Statistics**
    - Data Tables: `covid_deaths`
    - SQL Query: Global Statistics

8. **Population and Vaccination Statistics**
    - Data Tables: `covid_deaths`, `covid_vaccinations`
    - SQL Query: Population and Vaccination Statistics

9. **CTE (Common Table Expression) Usage**
    - Data Tables: `covid_deaths`, `covid_vaccinations`
    - SQL Query: CTE Usage

10. **Temporary Table Usage**
    - Data Tables: `covid_deaths`, `covid_vaccinations`
    - SQL Query: Temporary Table Usage

11. **Creating a View to Store Data for Later Visualizations**
    - Data Tables: `covid_deaths`, `covid_vaccinations`
    - SQL Query: Creating a View

## Python Code for Data Transfer

Python code written for transferring COVID-19 data used in the analysis to a PostgreSQL database.

```python
import pandas as pd
import psycopg2
from sqlalchemy import create_engine
