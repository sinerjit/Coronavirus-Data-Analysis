# COVID-19 Data Analysis Project

This project is a Data Analyst portfolio project aimed at analyzing COVID-19 data.

## Analyses

You can find the SQL queries and Python code for the analyses conducted on COVID-19 death and vaccination data below:

- [SQL Queries for Data Analysis](#sql-queries-for-data-analysis)
- [Python Code for Data Transfer](#python-code-for-data-transfer)

## SQL Queries for Data Analysis

Below are the SQL queries conducted on COVID-19 death and vaccination data:

1. **Total Case and Death Statistics**
    - Data Tables: `covid_deaths`
    - SQL Query: [Total Case and Death Statistics](#total-case-and-death-statistics)

2. **Country-specific Death Rates**
    - Data Tables: `covid_deaths`
    - SQL Query: [Country-specific Death Rates](#country-specific-death-rates)

3. **Infection Ratios in Population by Country**
    - Data Tables: `covid_deaths`
    - SQL Query: [Infection Ratios in Population by Country](#infection-ratios-in-population-by-country)

4. **Countries with Highest Infection Ratios**
    - Data Tables: `covid_deaths`
    - SQL Query: [Countries with Highest Infection Ratios](#countries-with-highest-infection-ratios)

5. **Countries with Highest Death Counts**
    - Data Tables: `covid_deaths`
    - SQL Query: [Countries with Highest Death Counts](#countries-with-highest-death-counts)

6. **Continents with Highest Death Counts**
    - Data Tables: `covid_deaths`
    - SQL Query: [Continents with Highest Death Counts](#continents-with-highest-death-counts)

7. **Global Statistics**
    - Data Tables: `covid_deaths`
    - SQL Query: [Global Statistics](#global-statistics)

8. **Population and Vaccination Statistics**
    - Data Tables: `covid_deaths`, `covid_vaccinations`
    - SQL Query: [Population and Vaccination Statistics](#population-and-vaccination-statistics)

9. **CTE (Common Table Expression) Usage**
    - Data Tables: `covid_deaths`, `covid_vaccinations`
    - SQL Query: [CTE Usage](#cte-usage)

10. **Temporary Table Usage**
    - Data Tables: `covid_deaths`, `covid_vaccinations`
    - SQL Query: [Temporary Table Usage](#temporary-table-usage)

11. **Creating a View to Store Data for Later Visualizations**
    - Data Tables: `covid_deaths`, `covid_vaccinations`
    - SQL Query: [Creating a View](#creating-a-view)

## Python Code for Data Transfer

Python code written for transferring COVID-19 data used in the analysis to a PostgreSQL database.

```python
import pandas as pd
import psycopg2
from sqlalchemy import create_engine
