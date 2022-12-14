CREATE TABLE Employee (
	ID int NOT NULL PRIMARY KEY,
	FName nvarchar(30),
	LName nvarchar(30),
	Manager_ID int FOREIGN KEY REFERENCES Employee)

CREATE TABLE Manager (
	ID int NOT NULL PRIMARY KEY,
	FName nvarchar(30),
	LName nvarchar(30),
	Manager_ID int)


INSERT INTO Employee VALUES 
(1, 'John', 'Smith', NULL),
(2, 'Jack', 'Brown', NULL),
(3, 'Leon', 'Bush', 1),
(4, 'Ann', 'Baker', 1),
(5, 'Kristina', 'Petersen', 2),
(6, 'Alexander', 'Katz', 3)

INSERT INTO Manager VALUES 
(1, 'John', 'Smith', NULL),
(2, 'Jack', 'Brown', NULL),
(3, 'Leon', 'Bush', 1),
(4, 'Ann', 'Baker', 1),
(5, 'Kristina', 'Petersen', 2),
(6, 'Alexander', 'Katz', 3)


SELECT E.ID, E.FName, E.LName, M.ID M_ID, M.FName M_FName, M.LName M_LName
FROM Employee E JOIN Manager M
ON E.Manager_ID=M.ID