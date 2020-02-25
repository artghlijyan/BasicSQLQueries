---------------------------
--ADD NEW COLUMN
ALTER TABLE Customers
ADD [Address] NVARCHAR(50) NOT NULL DEFAULT 'No Address'; --if address must be not null, and table has rows

---------------------------
--DELETE COLUMN
ALTER TABLE Customers
DROP COLUMN [Address];

---------------------------
--ADD CHECK
ALTER TABLE Customers WITH NOCHECK -- In Case when tabel already has values for Age, then existing values won't be checked, otherwise we'll get error and uncomplete query
ADD CHECK (Age > 21);

---------------------------
--ADD FOREIGN KEY
CREATE TABLE Customers
(
    Id INT PRIMARY KEY IDENTITY,
    Age INT DEFAULT 18, 
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Email VARCHAR(30) UNIQUE,
    Phone VARCHAR(20) UNIQUE
);
CREATE TABLE Orders
(
    Id INT IDENTITY,
    CustomerId INT,
    CreatedAt Date
);
ALTER TABLE Orders
ADD FOREIGN KEY(CustomerId) REFERENCES Customers(Id);

---------------------------
--ADD PRIMARY KEY
ALTER TABLE Orders
ADD PRIMARY KEY (Id);

---------------------------
--ADD CONSTRAINTS
ALTER TABLE Orders
ADD CONSTRAINT PK_Orders_Id PRIMARY KEY (Id), --PK CONSTRAINT
    CONSTRAINT FK_Orders_To_Customers FOREIGN KEY(CustomerId) REFERENCES Customers(Id); --FK CONSTRAINT
ALTER TABLE Customers
ADD CONSTRAINT CK_Age_Greater_Than_Zero CHECK (Age > 0); --CHECK CONSTRAINT

---------------------------
--DELETE CONSTRAINT
ALTER TABLE Orders
DROP FK_Orders_To_Customers;
