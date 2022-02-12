# NCR Covid Tracker Database
A COVID-19 Cases Tracker made using SQL for cases within Metro Manila. A project I developed for my course CS 165, Database Systems, in UPD.

As the name suggests, this application would be used to track the amount of COVID-19 cases within Metro Manila, namely, the 16 cities of Manila, Quezon City, Caloocan, Las Piñas, Makati, Malabon, Mandaluyong, Marikina, Muntinlupa, Navotas, Parañaque, Pasay, Pasig, San Juan, Taguig, and Valenzuela. Furthermore, this application would not only track the amount of COVID-19 positive individuals, but also the number of recoveries and deaths.

## Dependencies
- Have the appropriate software to be able to run SQL scripts, preferably (or for this project's case) MySQL Workbench.

## Installation / Running
- Download both NCRCovidTracker.sql and CS165_PROJECT_QUERIES.sql files.
- Execute NCRCovidTracker.sql, this creates a database named ncrcovidtracker which also populates said database with pre-generated data (used dbForge Data Generator for MySQL).
- Execute sample queries in CS165_PROJECT_QUERIES.sql to your liking (each query has a comment above it detailing what that query is for).

## Functionalities of the application
- Display in table the active COVID-19 (severe, mild, asymptomatic, or all three), recovered, deceased, or confirmed (active + recovered + died) cases within Metro Manila or within the specified city/cities, age range, or gender.
- Show the percentages of healthy, recovered, infected, or dead individuals within Metro Manila or per City/Cities from the total population (population per City will be based on data from PSA statistics).

## Assumptions
- Populated data will not take into account dates (date/s of infection, recovery, death, etc.).
- The total population per city will be based on PSA data from the 2015 national census.
- Infection would not take into account where the individual was infected, i.e. if an individual lives in Makati but was infected (in reality) in Malabon, the additional infected entry would be in Makati.

## Sample queries
![alt text](https://github.com/mspardinas/MySQL-NCR-Covid-Tracker-Database/blob/master/readme-images/query-1a.png)
![alt text](https://github.com/mspardinas/MySQL-NCR-Covid-Tracker-Database/blob/master/readme-images/query-1c.png)
![alt text](https://github.com/mspardinas/MySQL-NCR-Covid-Tracker-Database/blob/master/readme-images/query-1f.png)
