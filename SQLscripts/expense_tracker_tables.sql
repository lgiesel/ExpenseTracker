-- Can drop DB first, IF no other db users are using your DB
 DROP DATABASE IF EXISTS xp;
 CREATE DATABASE xp;
 USE xp;
-- or 
-- individually drop tables in reverse order of FK constraints
--
DROP TABLE IF EXISTS Expense;
DROP TABLE IF EXISTS Category;

CREATE TABLE Category
(
	ID						INT	PRIMARY KEY AUTO_INCREMENT,
	CategoryName	VARCHAR(100) 	NOT NULL,
	CONSTRAINT ucat_name UNIQUE (CategoryName)
);

CREATE TABLE Expense
(
	ID					  INT				PRIMARY KEY AUTO_INCREMENT,
	Date				  DATE			NOT NULL,
	CategoryID	  INT(12) 	NOT NULL,
  Amount        DECIMAL(12, 2)  NOT NULL,
	Expense_Desc	VARCHAR(75)		,
	FOREIGN KEY (CategoryID) REFERENCES Category (ID)
);

-- Add or change categories as needed
INSERT INTO category (ID, CategoryName) VALUES 
	(1, 'GENERAL'),
	(2, 'GROCERIES'),
	(3, 'BILLS'),
	(4, 'TAKE OUT/RESTAURANTS'),
	(5, 'ENTERTAINMENT'),
	(6, 'TOBACCO'),
	(7, 'TRANSPORTATION'),
	(8, 'MEDICINE'),
	(9, 'CHILD SUPPORT/ALIMONY'),
	(10, 'RENT'); 