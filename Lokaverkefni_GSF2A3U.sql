/*************************** 1 ***************************/

DROP SCHEMA IF EXISTS `2605993489_TinyVideo`;

CREATE SCHEMA IF NOT EXISTS `2605993489_TinyVideo`;

USE `2605993489_TinyVideo`;

CREATE TABLE IF NOT EXISTS PRICE(
	PRICE_CODE INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	PRICE_DESCRIPTION VARCHAR(255),
	PRICE_RENTFEE DECIMAL(6, 2),
	PRICE_DAILYLATEFEE DECIMAL(6, 2)
);

CREATE TABLE IF NOT EXISTS MOVIE(
	MOVIE_NUM INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    MOVIE_TITLE VARCHAR(255),
    MOVIE_YEAR INT,
    MOVIE_COST DECIMAL(6, 2),
    MOVIE_GENRE VARCHAR(255),
    PRICE_CODE INT,
    FOREIGN KEY (PRICE_CODE) REFERENCES PRICE(PRICE_CODE)
);

ALTER TABLE MOVIE AUTO_INCREMENT = 1234;

CREATE TABLE IF NOT EXISTS VIDEO(
	VID_NUM INT PRIMARY KEY NOT NULL,
    VID_INDATE DATE,
    MOVIE_NUM INT,
    FOREIGN KEY (MOVIE_NUM) REFERENCES MOVIE(MOVIE_NUM)
);

CREATE TABLE IF NOT EXISTS MEMBERSHIP(
	MEM_NUM INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    MEM_FNAME VARCHAR(255),
    MEM_LNAME VARCHAR(255),
    MEM_STREET VARCHAR(255),
    MEM_CITY VARCHAR(255),
    MEM_STATE CHAR(2),
    MEM_ZIP INT,
    MEM_BALANCE DECIMAL(6, 2)
);

ALTER TABLE MEMBERSHIP AUTO_INCREMENT = 102;


CREATE TABLE IF NOT EXISTS RENTAL(
	RENT_NUM INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    RENT_DATE DATE,
    MEM_NUM INT,
    FOREIGN KEY (MEM_NUM) REFERENCES MEMBERSHIP(MEM_NUM)
);

ALTER TABLE RENTAL AUTO_INCREMENT = 1001;


CREATE TABLE IF NOT EXISTS DETAILRENTAL(
	RENT_NUM INT NOT NULL,
    VID_NUM INT NOT NULL,
    DETAIL_FEE DECIMAL(6, 2),
    DETAIL_DUEDATE DATE,
    DETAIL_RETURNDATE DATE,
    DETAIL_DAILYLATEFEE DECIMAL(6, 2),
    PRIMARY KEY (RENT_NUM, VID_NUM),
    FOREIGN KEY (RENT_NUM) REFERENCES RENTAL(RENT_NUM),
    FOREIGN KEY (VID_NUM) REFERENCES VIDEO(VID_NUM)
);

/*************************** 2 ***************************/

INSERT INTO MEMBERSHIP(MEM_FNAME, MEM_LNAME, MEM_STREET, MEM_CITY, MEM_STATE, MEM_ZIP, MEM_BALANCE)
VALUES
('Tami', 'Dawson', '2632 Takli Circle', 'Norene', 'TN', 37136, 11),
('Curt', 'Knight', '4025 Cornell Court', 'Flatgap', 'KY', 41219, 6),
('Jamal', 'Melendez', '788 East 145th Avenue', 'Quebeck', 'TN', 38579, 0),
('Iva', 'Mcclain', '6045 Musket Ball Cicle', 'Summit', 'KY', 42783, 15.00),
('Miranda', 'Parks', '4469 Maxwell Place', 'Germantown', 'TN', 38183, 0.00),
('Rosario', 'Elliot', '7578 Danner Avenue', 'Columbia', 'TN', 38402, 5.00),
('Mattie', 'Guy', '4390 Evergreen Street', 'Lily', 'KY', 40740, 10.00),
('Clint', 'Ochoa', '1711 Elm Street', 'Greeneville', 'TN', 37745, 0.00),
('Lewis', 'Rosales', '4524 Southwild Circle', 'Counce', 'TN', 38326, 0.00),
('Stacy', 'Mann', '2789 East Cook Avenue', 'Murfreesboro', 'TN', 37132, 8.00),
('Luis', 'Trujillo', '7267 Melvin Avenue', 'Heiskell', 'TN', 37754, 3.00),
('Minnie', 'Gonzales', '6430 Vasili Drive', 'Williston', 'TN', 38076, 0.00);


INSERT INTO RENTAL(RENT_DATE, MEM_NUM)
VALUES
('2009-03-01', 103),
('2009-03-01', 105),
('2009-03-02', 102),
('2009-03-02', 110),
('2009-03-02', 111),
('2009-03-02', 107),
('2009-03-02', 104),
('2009-03-03', 105),
('2009-03-03', 111);

INSERT INTO PRICE(PRICE_DESCRIPTION, PRICE_RENTFEE, PRICE_DAILYLATEFEE)
VALUES
('Standard', 2.00, 1),
('New Release', 3.50, 3),
('Discount', 1.50, 1),
('Weekly Special', 1.00, 0.5);

INSERT INTO MOVIE(MOVIE_NUM, MOVIE_TITLE, MOVIE_YEAR, MOVIE_COST, MOVIE_GENRE, PRICE_CODE)
VALUES
(1234, 'The Cesar Family Christmas', 2007, 39.95, 'FAMILY', 2),
(1235, 'Smokey Mountain Wildlife', 2004, 59.95, 'ACTION', 1),
(1236, 'Richard Goodhope', 2008, 59.95, 'DRAMA', 2),
(1237, 'Beatnik Fever', 2007, 29.95, 'COMEDY', 2),
(1238, 'Constant Companion', 2008, 89.95, 'DRAMA', 2),
(1239, 'Where Hope Dies', 1998, 25.49, 'DRAMA', 3),
(1245, 'Time to Burn', 2005, 45.49, 'ACTION', 1),
(1246, 'What He Doesn\'t Know', 2000, 58.29, 'COMEDY', 1);


INSERT INTO VIDEO(VID_NUM, VID_INDATE, MOVIE_NUM)
VALUES
(54321, '2008-06-18', 1234),
(54324, '2008-06-18', 1234),
(54325, '2008-06-18', 1234),
(34341, '2007-01-22', 1235),
(34342, '2007-01-22', 1235),
(34366, '2009-03-02', 1236),
(34367, '2009-03-02', 1236),
(34368, '2009-03-02', 1236),
(34369, '2009-03-02', 1236),
(44392, '2008-10-21', 1237),
(44397, '2008-10-21', 1237),
(59237, '2009-02-14', 1237),
(61388, '2007-01-25', 1237),
(61353, '2006-01-28', 1239),
(61354, '2006-01-28', 1245),
(61367, '2008-07-30', 1246),
(61369, '2008-07-30', 1246);

INSERT INTO DETAILRENTAL(RENT_NUM, VID_NUM, DETAIL_FEE, DETAIL_DUEDATE, DETAIL_RETURNDATE, DETAIL_DAILYLATEFEE)
VALUES
(1001, 54321, 0.5, '2009-03-03', '2009-03-03', 4.5),
(1002, 54324, 1.0, '2009-03-05', '2009-03-05', 4.0),
(1003, 54325, 1.5, '2009-03-04', '2009-03-09', 3.5),
(1003, 44392, 1.5, '2009-03-06', '2009-03-09', 3.5),
(1003, 44397, 1.5, '2009-03-06', '2009-03-09', 3.5),
(1004, 34341, 2.0, '2009-03-05', '2009-03-07', 3.0),
(1005, 34342, 2.5, '2009-03-06', '2009-03-06', 2.5),
(1006, 34366, 3.0, '2009-03-06', '2009-03-06', 2.0),
(1007, 34367, 3.5, '2009-03-07', '2009-03-07', 1.5),
(1008, 34368, 4.0, '2009-03-07', NULL, 1.0),
(1009, 34369, 4.5, '2009-03-08', '2009-03-09', 0.5);

/*************************** 3 ***************************/

SELECT MOVIE_TITLE, MOVIE_YEAR, MOVIE_COST
	FROM MOVIE
    WHERE MOVIE_TITLE LIKE '%hope%'
	ORDER BY MOVIE_TITLE;

/*************************** 4 ***************************/

SELECT MOVIE_TITLE, MOVIE_YEAR, MOVIE_GENRE
	FROM MOVIE
    WHERE MOVIE_GENRE = 'ACTION';

/*************************** 5 ***************************/

SELECT MOVIE_NUM, MOVIE_TITLE, MOVIE_COST
	FROM MOVIE
    WHERE MOVIE_COST > 40;

/*************************** 6 ***************************/

SELECT MOVIE_NUM, MOVIE_TITLE, MOVIE_COST, MOVIE_GENRE
	FROM MOVIE
    WHERE (MOVIE_GENRE = 'ACTION' 
		OR MOVIE_GENRE = 'COMEDY')
        AND MOVIE_COST < 50.00
	ORDER BY MOVIE_GENRE;

/*************************** 7 ***************************/

SELECT MOVIE_NUM, CONCAT(MOVIE_TITLE, ' (', MOVIE_YEAR, ')  ', MOVIE_GENRE) AS 'Movie Description'
	FROM MOVIE;

/*************************** 8 ***************************/

SELECT MOVIE_GENRE, COUNT(MOVIE_GENRE) AS 'Number of Movies'
	FROM MOVIE
    GROUP BY MOVIE_GENRE;

/*************************** 9 ***************************/

SELECT ROUND(avg(MOVIE_COST), 4) AS 'Average Movie Cost'
	FROM MOVIE;

/*************************** 10 ***************************/

SELECT MOVIE_GENRE, ROUND(AVG(MOVIE_COST), 2) AS 'Average Cost'
	FROM MOVIE
    GROUP BY MOVIE_GENRE;

/*************************** 11 ***************************/

SELECT MOVIE.MOVIE_TITLE, MOVIE.MOVIE_GENRE, PRICE.PRICE_DESCRIPTION, PRICE.PRICE_RENTFEE
	FROM MOVIE
    INNER JOIN PRICE
		ON MOVIE.PRICE_CODE = PRICE.PRICE_CODE;

/*************************** 12 ***************************/

SELECT MOVIE.MOVIE_GENRE, ROUND(AVG(PRICE.PRICE_RENTFEE), 2)
	FROM MOVIE
    INNER JOIN PRICE
		ON MOVIE.PRICE_CODE = PRICE.PRICE_CODE
	GROUP BY MOVIE.MOVIE_GENRE;

/*************************** 13 ***************************/

SELECT MOVIE.MOVIE_TITLE, MOVIE.MOVIE_YEAR, MOVIE.MOVIE_COST / PRICE.PRICE_RENTFEE AS 'Breakeven Rentals'
	FROM MOVIE
    INNER JOIN PRICE
		ON MOVIE.PRICE_CODE = PRICE.PRICE_CODE;


/*************************** 14 ***************************/

 SELECT MOVIE_TITLE, MOVIE_YEAR
	 FROM MOVIE
	 WHERE PRICE_CODE IS NOT NULL;

/*************************** 15 ***************************/

SELECT MOVIE_TITLE, MOVIE_YEAR, MOVIE_COST
	FROM MOVIE
	WHERE MOVIE_COST BETWEEN 44.99 AND 49.99;

/*************************** 16 ***************************/

SELECT MOVIE.MOVIE_TITLE, MOVIE.MOVIE_YEAR, PRICE.PRICE_DESCRIPTION, PRICE.PRICE_RENTFEE
	FROM MOVIE
    INNER JOIN PRICE
		ON MOVIE.PRICE_CODE = PRICE.PRICE_CODE
	WHERE MOVIE.MOVIE_GENRE IN ('FAMILY', 'COMEDY', 'DRAMA');

/*************************** 17 ***************************/

SELECT MIN(MEM_BALANCE) AS 'Minimum Balance', MAX(MEM_BALANCE) AS 'Maximum Balance', AVG(MEM_BALANCE) AS 'Average Balance'
	FROM MEMBERSHIP;

/*************************** 18 ***************************/



/*************************** 19 ***************************/



/*************************** 20 ***************************/



/*************************** 21 ***************************/



/*************************** 22 ***************************/



/*************************** 23 ***************************/



/*************************** 24 ***************************/



/*************************** 25 ***************************/



/*************************** 26 ***************************/



/*************************** 27 ***************************/



/*************************** 28 ***************************/



/*************************** 29 ***************************/



/*************************** 30 ***************************/



/*************************** 31 ***************************/



/*************************** 32 ***************************/



/*************************** 33 ***************************/



/*************************** 34 ***************************/



/*************************** 35 ***************************/


