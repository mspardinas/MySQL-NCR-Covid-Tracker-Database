-- CS 165 Project Deliverable 3: NCR Covid Tracker
-- MIGUEL S. PARDIÑAS
CREATE DATABASE IF NOT EXISTS ncrcovidtracker;
USE ncrcovidtracker;

CREATE TABLE city (
	CityName VARCHAR(40) NOT NULL,
    Population INT NOT NULL,
    PRIMARY KEY (CityName)
);

CREATE TABLE person (
	SSN INT NOT NULL,
	FirstName VARCHAR(40) NOT NULL,
	LastName VARCHAR(40) NOT NULL,
	BirthDate DATE NOT NULL,
	Gender VARCHAR(1) NOT NULL,
	City VARCHAR(40) NOT NULL,
    PRIMARY KEY (SSN),
    FOREIGN KEY(City) REFERENCES city(CityName)
);

CREATE TABLE healthstatus (
	CaseNumber INT NOT NULL AUTO_INCREMENT,
    SSN INT NOT NULL,
    RecordedDate DATE NOT NULL,
    HealthStatus VARCHAR(15) NOT NULL,
    PRIMARY KEY(CaseNumber, SSN, RecordedDate),
    FOREIGN KEY (SSN) REFERENCES person(SSN)
);

-- Dummy data generation, used dbForge Data Generator for MySQL
-- City population obtained from 2015 Philippine Census
-- 50 randomly generated data for Person, with 70 randomly generatead data for HealthStatus
INSERT INTO city VALUES
('Caloocan City', 1583978),
('Las Pinas City', 588894),
('Makati City', 582602),
('Malabon City', 365525),
('Mandaluyong City', 386276),
('Manila City', 1780148),
('Marikina City', 450741),
('Muntinlupa City', 504509),
('Navotas City', 249463),
('Paranaque City', 664822),
('Pasay City', 416522),
('Pasig City', 755300),
('Pateros City', 63840),
('Quezon City', 2936116),
('San Juan City', 122180),
('Taguig City', 804915),
('Valenzuela City', 620422);

INSERT INTO person VALUES
(1, 'Conrad', 'Baumann', '1991-01-04', 'M', 'Navotas City'),
(2, 'Morgan', 'Renteria', '1951-01-04', 'M', 'Manila City'),
(3, 'Micheal', 'Neeley', '1931-01-04', 'M', 'Pateros City'),
(4, 'Adam', 'Reyes', '2009-01-04', 'F', 'Navotas City'),
(5, 'Kittie', 'Mathews', '1948-04-03', 'M', 'Caloocan City'),
(6, 'Stefani', 'Keenan', '1978-06-11', 'M', 'Quezon City'),
(7, 'Madelene', 'Neely', '2002-08-23', 'F', 'Muntinlupa City'),
(8, 'Ramiro', 'Galindo', '1951-01-08', 'M', 'Malabon City'),
(9, 'Abraham', 'Cary', '1931-01-08', 'M', 'Quezon City'),
(10, 'Amos', 'Reyna', '1951-02-21', 'M', 'Pasay City'),
(11, 'Josef', 'Mathis', '1991-06-13', 'F', 'Valenzuela City'),
(12, 'Keira', 'Delacruz', '1939-11-26', 'M', 'Caloocan City'),
(13, 'Abby', 'Baumgartner', '1933-02-16', 'M', 'Quezon City'),
(14, 'Cathryn', 'Casas', '1987-11-03', 'F', 'Paranaque City'),
(15, 'Gail', 'Neff', '1983-04-04', 'M', 'Paranaque City'),
(16, 'Danilo', 'Keene', '1988-07-02', 'F', 'Malabon City'),
(17, 'Alaina', 'Gallagher', '1951-02-14', 'M', 'Pasig City'),
(18, 'Gaylord', 'Bautista', '1997-01-22', 'M', 'Pateros City'),
(19, 'Scotty', 'Case', '1967-06-15', 'F', 'Pasay City'),
(20, 'Efrain', 'Reynolds', '1951-10-28', 'F', 'Las Pinas City'),
(21, 'Horacio', 'Delagarza', '1936-10-26', 'M', 'Pasig City'),
(22, 'Makeda', 'Baxley', '1952-09-30', 'F', 'Pateros City'),
(23, 'Jose', 'Casey', '1960-04-22', 'M', 'Las Pinas City'),
(24, 'Bert', 'Negrete', '1960-08-15', 'M', 'Malabon City'),
(25, 'Shane', 'Reynoso', '2003-01-04', 'F', 'Makati City'),
(26, 'Kent', 'Wagoner', '1991-01-08', 'M', 'Taguig City'),
(27, 'Rob', 'Gallant', '1951-03-07', 'M', 'Manila City'),
(28, 'Jon', 'Baxter', '2003-10-08', 'M', 'Marikina City'),
(29, 'Armand', 'Cash', '1942-04-26', 'M', 'Quezon City'),
(30, 'Beth', 'Delarosa', '1952-02-19', 'F', 'Taguig City'),
(31, 'Epifania', 'Matlock', '2003-01-08', 'F', 'Caloocan City'),
(32, 'Meridith', 'Gallardo', '2010-08-16', 'M', 'San Juan City'),
(33, 'Laverna', 'Sisson', '1940-12-19', 'M', 'Marikina City'),
(34, 'Marguerite', 'Keener', '1932-09-30', 'M', 'Pateros City'),
(35, 'Alyce', 'Negron', '1993-01-07', 'F', 'Mandaluyong City'),
(36, 'Shani', 'Matney', '2003-06-13', 'M', 'Caloocan City'),
(37, 'Bennie', 'Bayer', '1951-01-25', 'M', 'Muntinlupa City'),
(38, 'Edmundo', 'Wahl', '1958-07-16', 'F', 'Taguig City'),
(39, 'Vella', 'Casillas', '1980-09-08', 'F', 'Las Pinas City'),
(40, 'Norris', 'Delatorre', '1940-04-22', 'M', 'Paranaque City'),
(41, 'Adela', 'Sizemore', '1939-04-07', 'M', 'Mandaluyong City'),
(42, 'Cleta', 'Keeney', '1960-06-15', 'M', 'Paranaque City'),
(43, 'Kerry', 'Baylor', '1972-03-19', 'M', 'San Juan City'),
(44, 'Nell', 'Waite', '1974-11-22', 'M', 'Taguig City'),
(45, 'Ned', 'Rhea', '2009-01-08', 'F', 'Taguig City'),
(46, 'Kasie', 'Gallegos', '1974-12-11', 'M', 'Navotas City'),
(47, 'Coleman', 'Matos', '1931-03-07', 'M', 'Marikina City'),
(48, 'Curtis', 'Deleon', '1963-06-15', 'F', 'Pateros City'),
(49, 'Lamar', 'Gallo', '1951-01-10', 'M', 'Makati City'),
(50, 'Tyrell', 'Skaggs', '1951-03-01', 'M', 'Quezon City');

INSERT INTO healthstatus VALUES
(1, 1, '2020-01-17', 'Mild'),
(2, 4, '2020-01-25', 'Asymptomatic'),
(3, 2, '2020-02-04', 'Deceased'),			-- SSN 2 latest deceased
(4, 3, '2020-02-14', 'Deceased'),			-- SSN 3 latest deceased
(5, 1, '2020-03-05', 'Asymptomatic'),		-- SSN 1 latest asymptomatic
(6, 4, '2020-03-13', 'Recovered'),			-- SSN 4 latest recovered
(7, 5, '2020-03-23', 'Asymptomatic'),		-- SSN 5 latest asymptomatic
(8, 6, '2020-04-08', 'Mild'),				-- SSN 6 latest mild
(9, 7, '2020-04-09', 'Severe'),
(10, 11, '2020-04-13', 'Severe'),
(11, 8, '2020-04-17', 'Asymptomatic'),		-- SSN 8 latest asymptomatic
(12, 9, '2020-05-06', 'Asymptomatic'),		-- SSN 9 latest asymptomatic
(13, 10, '2020-05-10', 'Deceased'),			-- SSN 10 latest deceased
(14, 11, '2020-05-11', 'Recovered'),		-- SSN 11 latest recovered
(15, 7, '2020-05-19', 'Deceased'),			-- SSN 7 latest deceased
(16, 12, '2020-05-22', 'Mild'),				-- SSN 12 latest mild
(17, 13, '2020-06-03', 'Asymptomatic'),		-- SSN 13 latest asymptomatic
(18, 14, '2020-06-09', 'Severe'),
(19, 14, '2020-06-09', 'Deceased'),			-- SSN 14 latest deceased, **SAME DAY CASE**
(20, 15, '2020-06-20', 'Deceased'),
(21, 16, '2020-06-24', 'Asymptomatic'),
(22, 17, '2020-07-03', 'Asymptomatic'),
(23, 19, '2020-07-05', 'Mild'),
(24, 18, '2020-07-11', 'Mild'),
(25, 17, '2020-07-15', 'Recovered'),
(26, 19, '2020-07-20', 'Severe'),
(27, 20, '2020-07-27', 'Mild'),
(28, 21, '2020-08-07', 'Asymptomatic'),
(29, 22, '2020-08-14', 'Asymptomatic'),
(30, 23, '2020-08-28', 'Mild'),
(31, 24, '2020-08-29', 'Severe'),
(32, 24, '2020-09-01', 'Recovered'),
(33, 25, '2020-09-11', 'Severe'),
(34, 25, '2020-09-22', 'Deceased'),
(35, 26, '2020-10-06', 'Asymptomatic'),
(36, 26, '2020-10-14', 'Recovered'),
(37, 27, '2020-10-20', 'Mild'),
(38, 27, '2020-10-21', 'Asymptomatic'),
(39, 28, '2020-10-30', 'Asymptomatic'),
(40, 28, '2020-11-09', 'Recovered'),
(41, 29, '2020-11-14', 'Asymptomatic'),
(42, 30, '2020-11-19', 'Asymptomatic'),
(43, 30, '2020-11-29', 'Recovered'),
(44, 31, '2020-12-13', 'Mild'),
(45, 31, '2020-12-22', 'Asymptomatic'),
(46, 32, '2020-12-24', 'Severe'),
(47, 32, '2021-01-06', 'Deceased'),
(48, 33, '2021-01-17', 'Asymptomatic'),
(49, 34, '2021-01-23', 'Asymptomatic'),
(50, 35, '2021-02-11', 'Mild'),
(51, 36, '2021-02-15', 'Mild'),
(52, 37, '2021-02-23', 'Asymptomatic'),
(53, 38, '2021-02-26', 'Mild'),
(54, 38, '2021-03-02', 'Recovered'),
(55, 39, '2021-03-08', 'Deceased'),
(56, 40, '2021-03-16', 'Mild'),
(57, 41, '2021-03-20', 'Asymptomatic'),
(58, 41, '2021-03-26', 'Recovered'),
(59, 42, '2021-03-28', 'Asymptomatic'),
(60, 43, '2021-04-03', 'Mild'),
(61, 43, '2021-04-07', 'Severe'),
(62, 44, '2021-04-15', 'Mild'),
(63, 44, '2021-04-19', 'Recovered'),
(64, 45, '2021-04-20', 'Severe'),
(65, 46, '2021-04-24', 'Asymptomatic'),
(66, 47, '2021-05-06', 'Mild'),
(67, 48, '2021-05-15', 'Deceased'),
(68, 49, '2021-05-29', 'Severe'),
(69, 49, '2021-06-02', 'Mild'),
(70, 50, '2021-06-06', 'Asymptomatic');

-- DELETE DB
-- DROP DATABASE ncrcovidtracker;