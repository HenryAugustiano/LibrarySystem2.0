DROP TABLE books;
DROP TABLE users;

CREATE TABLE books (
	isbn INT,
	bookName VARCHAR(30),
	author VARCHAR(50),
	yearPub INT,
	genre VARCHAR(50),
    qty INT,
    borrowed char(1),
    originalAmt INT,
	PRIMARY KEY (isbn) 
	);

CREATE TABLE users (
	uid INT IDENTITY,
	uname VARCHAR(30),
	password VARCHAR(20),
	lvl INT,
    book1 VARCHAR(50),
    book2 VARCHAR(50),
    date1 DATE,
    date2 DATE,
	PRIMARY KEY (uid) 
	);

INSERT INTO books values (11111, 'The History of Tom Jones', 'Henry Fielding', 1749, 'fiction', 3, 'T', 5),
(11112,'Pride and Prejudice','Jane Austen',1813,'romance',2,'T',3),
(11113,'The Red and the Black','Stendhal',1830,'bildungsroman',4,'T',5),
(11114,'Le Pere Goriot','Honore de Balzac',1835,'fiction',4,'T',4),
(11115,'David Copperfield','Charles Dickens',1850,'bildungsroman',4,'T',4),
(11116,'Madame Bovary','Gustave Flaubert',1856,'fiction',6,'T',6),
(11117,'Moby-Dick','Herman Malville',1851,'epic',3,'T',4),
(11118,'Wuthering Heights','Emily Bronte',1847,'tragedy',2,'F',2),
(11119,'The Brothers Karamazov','Dostoevsky',1879,'philosophy',2,'T',3),
(11120,'War and Peace','Tolstoy',1869,'romance',3,'T',4),
(11121,'Alice','Matt',1500,'romance',4,'F',4);

DECLARE @uid int
INSERT INTO users (uname, password, lvl, book1, book2, date1, date2) VALUES ('catdog', 'catcat123', '1', 'Pride and Prejudice', NULL, '2022-10-03', NULL);
INSERT INTO users (uname, password, lvl, book1, book2, date1, date2) VALUES ('monstercute', 'cute1212', '1', 'The Red and the Blac', 'The History of Tom J', '2022-11-04', '2022-11-04');
INSERT INTO users (uname, password, lvl, book1, book2, date1, date2) VALUES ('catslayer66', 'slaycat12', '1', NULL, NULL, NULL, NULL);
INSERT INTO users (uname, password, lvl, book1, book2, date1, date2) VALUES ('ubcostudent', 'goheat', '1', 'The Brothers Karamaz', 'Moby-Dick', '2022-11-02', '2022-11-15');
INSERT INTO users (uname, password, lvl, book1, book2, date1, date2) VALUES ('katyplaty', 'jibakutai', '0', 'War and Peace', NULL, '2022-11-23', NULL);
INSERT INTO users (uname, password, lvl, book1, book2, date1, date2) VALUES ('taylorjeez', 'nienfu', '0', 'The History of Tom J', NULL, '2022-10-01', NULL);
