-- NCR Covid tracker queries
USE ncrcovidtracker;

-- Project Deliverable 3 - MIGUEL S. PARDIÑAS
-- SQL Queries from functionalities in Project Deliverable 1:
-- (1) Display in table the active COVID-19 (severe, mild, asymptomatic, or all three), recovered, deceased, 
-- or confirmed (active + recovered + died) cases within Metro Manila or within the specified city/cities, age range, or gender.
-- (2) Show the percentages of healthy, recovered, infected, or dead individuals within Metro Manila 
-- or per City/Cities from the total population (population per City will be based on data from PSA statistics).

-- (1.A.) Display in table all health statuses of recorded people within Metro Manila. Show SSN, First name, Last name, city, and health status. Order by SSN
SELECT person.SSN, person.FirstName, person.LastName, person.City, healthstatus.HealthStatus
FROM person, healthstatus
WHERE healthstatus.SSN = person.SSN AND healthstatus.CaseNumber IN
(
	SELECT MAX(CaseNumber) 
	FROM healthstatus
	GROUP BY SSN
)
ORDER BY SSN;

-- (1.B.) Display in table all people with active COVID-19 (severe, mild, or asymptomatic) within Metro Manila. Show SSN, First name, Last name, city, and health status. Order by SSN
SELECT person.SSN, person.FirstName, person.LastName, person.City, healthstatus.HealthStatus
FROM person, healthstatus
WHERE (healthstatus.HealthStatus = 'Asymptomatic' OR healthstatus.HealthStatus = 'Mild' OR healthstatus.HealthStatus = 'Severe')
AND healthstatus.SSN = person.SSN AND healthstatus.CaseNumber IN
(
	SELECT MAX(CaseNumber) 
	FROM healthstatus
	GROUP BY SSN
)
ORDER BY SSN;

-- (1.C.) Display in table all people who died from COVID-19 within Metro Manila. Show SSN, First name, Last name, city, and health status. Order by SSN
SELECT person.SSN, person.FirstName, person.LastName, person.City, healthstatus.HealthStatus
FROM person, healthstatus
WHERE healthstatus.HealthStatus = 'Deceased' AND healthstatus.SSN = person.SSN AND healthstatus.CaseNumber IN
(
	SELECT MAX(CaseNumber) 
	FROM healthstatus
	GROUP BY SSN
)
ORDER BY SSN;

-- (1.D.) Display in table all people who recovered within Metro Manila. Show SSN, First name, Last name, city, and health status. Order by SSN
SELECT person.SSN, person.FirstName, person.LastName, person.City, healthstatus.HealthStatus
FROM person, healthstatus
WHERE healthstatus.HealthStatus = 'Recovered' AND healthstatus.SSN = person.SSN AND healthstatus.CaseNumber IN
(
	SELECT MAX(CaseNumber) 
	FROM healthstatus
	GROUP BY SSN
)
ORDER BY SSN;

-- (1.E.) Display in table all people from Quezon City or Mandaluyong City who has COVID-19 history. Show SSN, First name, Last name, city, and health status. Order by SSN
SELECT person.SSN, person.FirstName, person.LastName, person.City, healthstatus.HealthStatus
FROM person, healthstatus
WHERE (person.City = 'Quezon City' OR person.City = 'Mandaluyong City')
AND healthstatus.SSN = person.SSN AND healthstatus.CaseNumber IN
(
	SELECT MAX(CaseNumber) 
	FROM healthstatus
	GROUP BY SSN
)
ORDER BY SSN;

-- (1.F.) Display in table all males from Navotas City or Pateros City aged 30 years old and above with COVID-19 history.
-- Show SSN, First name, Last name, BirthDate as Age, Gender, city, and health status. Order by SSN
SELECT person.SSN, person.FirstName, person.LastName, TIMESTAMPDIFF(YEAR, person.BirthDate, CURDATE()) AS Age , person.Gender, person.City, healthstatus.HealthStatus
FROM person, healthstatus
WHERE person.Gender = 'M'
AND (person.City = 'Navotas City' OR person.City = 'Pateros City')
AND TIMESTAMPDIFF(YEAR, person.BirthDate, CURDATE()) >= 30
AND healthstatus.SSN = person.SSN AND healthstatus.CaseNumber IN
(
	SELECT MAX(CaseNumber) 
	FROM healthstatus
	GROUP BY SSN
)
ORDER BY SSN;

-- (2.A.) Display each City along with its number of people with COVID-19 history. Show City name and its respective number of cases as Cases, order by City name.
SELECT City, COUNT(*) AS Cases 
FROM	
(
	SELECT person.SSN, person.FirstName, person.LastName, person.City, healthstatus.HealthStatus
	FROM person, healthstatus
	WHERE healthstatus.SSN = person.SSN AND healthstatus.CaseNumber IN
	(
		SELECT MAX(CaseNumber) 
		FROM healthstatus
		GROUP BY SSN
	)
	ORDER BY SSN
) AS CityCases
GROUP BY City;

-- (2.B.) Display each City along with the percentage of people with COVID-19 history over total population (cases of city / city population * 100).
-- Show City name and the percentage as Percentage, order by City name.
SELECT City, COUNT(*)/city.Population*100 AS Percentage 
FROM	
(
	SELECT person.SSN, person.FirstName, person.LastName, person.City, healthstatus.HealthStatus
	FROM person, healthstatus
	WHERE healthstatus.SSN = person.SSN AND healthstatus.CaseNumber IN
	(
		SELECT MAX(CaseNumber) 
		FROM healthstatus
		GROUP BY SSN
	)
	ORDER BY SSN
) AS CityCases, city
WHERE CityCases.City = city.CityName
GROUP BY City;