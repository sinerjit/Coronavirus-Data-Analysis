# COVID-19 Data Analysis Project

## Overview
This project is a comprehensive analysis of COVID-19 data. I focused on:
- Calculating infection and death ratios globally and by country.
- Examining vaccination progress and its impact on populations.
- Writing advanced SQL queries for data analysis.
- Developing Python scripts to preprocess and upload data into a PostgreSQL database.

## Files in the Repository
- **Covid-Analysis.sql:** SQL queries I wrote to analyze COVID-19 data, including:
  - Infection and death rate calculations.
  - Vaccination progress tracking.
  - Creating views and temporary tables for advanced visualization.
- **CovidDeaths.csv:** A dataset I cleaned and transformed to make it suitable for analysis. This dataset includes information on COVID-19 deaths by country and date.
- **CovidVaccinations.csv:** A dataset I processed to analyze vaccination rates and trends globally.
- **data_add.py:** A Python script I developed to:
  - Read and clean the datasets.
  - Upload the cleaned data into a PostgreSQL database for further analysis.

## Requirements
To run this project, you need:
- **Python 3.x** with the following libraries:
  - pandas
  - psycopg2
  - SQLAlchemy
- **PostgreSQL** to store and query the data.
- A modern IDE such as Visual Studio Code.

## Installation and Usage
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/covid-analysis.git
2. Set up a virtual environment (optional but recommended):
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
3. Install the required dependencies:
   ```bash
   pip install -r requirements.txt
4. Run the Python script to upload data to PostgreSQL:
   ```bash
   python data_add.py
5. Use the SQL queries in Covid-Analysis.sql to analyze data within your PostgreSQL database.


## Results
- Discover trends in COVID-19 infection and death rates globally.
- Evaluate vaccination rates and their impact on populations.

