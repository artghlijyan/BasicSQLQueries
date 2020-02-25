---------------------------
CREATE TABLE Customers
(
    Id INT PRIMARY KEY,
    Age INT,
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20),
    Email VARCHAR(30),
    Phone VARCHAR(20)
)
--or
CREATE TABLE Customers
(
    Id INT,
    Age INT,
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20),
    Email VARCHAR(30),
    Phone VARCHAR(20),
    PRIMARY KEY(Id)
)
--2COLUMNS PRIMARY KEY
CREATE TABLE OrderLines
(
    OrderId INT,
    ProductId INT,
    Quantity INT,
    Price MONEY,
    PRIMARY KEY(OrderId, ProductId)
)

---------------------------
--IDENTITY
CREATE TABLE Customers
(
    Id INT PRIMARY KEY IDENTITY,
    Age INT,
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20),
    Email VARCHAR(30),
    Phone VARCHAR(20)
)
-- IDENTITY(seed, increment), seed - initail value, increment - jump value

---------------------------
--UNIQUE
CREATE TABLE Customers
(
    Id INT PRIMARY KEY IDENTITY,
    Age INT,
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20),
    Email VARCHAR(30) UNIQUE,
    Phone VARCHAR(20) UNIQUE
)
--or 
CREATE TABLE Customers
(
    Id INT PRIMARY KEY IDENTITY,
    Age INT,
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20),
    Email VARCHAR(30),
    Phone VARCHAR(20),
    UNIQUE(Email, Phone)
)

---------------------------
--DEFAULT with CHECK
CREATE TABLE Customers
(
    Id INT PRIMARY KEY IDENTITY,
    Age INT DEFAULT 18 CHECK(Age >0 AND Age < 100),
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Email VARCHAR(30) UNIQUE CHECK(Email !=''),
    Phone VARCHAR(20) UNIQUE CHECK(Phone !='')
)
--or
CREATE TABLE Customers
(
    Id INT PRIMARY KEY IDENTITY,
    Age INT DEFAULT 18,
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Email VARCHAR(30) UNIQUE,
    Phone VARCHAR(20) UNIQUE,
    CHECK((Age >0 AND Age<100) AND (Email !='') AND (Phone !=''))
)

---------------------------
--CONSTRAINT(for constraints is used PRIMARY KEY, UNIQUE, DEFAULT, CHECK)
--PK_ - Primary key
--FK_ - Foreign key
--CK_ - Check
--UQ_ - Unique
--DF_ - Default
CREATE TABLE Customers
(
    Id INT CONSTRAINT PK_Customer_Id PRIMARY KEY IDENTITY, -- PK_Customer_Id is constraint name
    Age INT
        CONSTRAINT DF_Customer_Age DEFAULT 18 
        CONSTRAINT CK_Customer_Age CHECK(Age >0 AND Age < 100),
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Email VARCHAR(30) CONSTRAINT UQ_Customer_Email UNIQUE,
    Phone VARCHAR(20) CONSTRAINT UQ_Customer_Phone UNIQUE
)
--or
CREATE TABLE Customers
(
    Id INT IDENTITY,
    Age INT CONSTRAINT DF_Customer_Age DEFAULT 18, 
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Email VARCHAR(30),
    Phone VARCHAR(20),
    CONSTRAINT PK_Customer_Id PRIMARY KEY (Id), 
    CONSTRAINT CK_Customer_Age CHECK(Age >0 AND Age < 100),
    CONSTRAINT UQ_Customer_Email UNIQUE (Email),
    CONSTRAINT UQ_Customer_Phone UNIQUE (Phone)
)

---------------------------
--FOREIGN KEY
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
    Id INT PRIMARY KEY IDENTITY,
    CustomerId INT REFERENCES Customers (Id),
    CreatedAt Date
)
--or
CREATE TABLE Orders
(
    Id INT PRIMARY KEY IDENTITY,
    CustomerId INT,
    CreatedAt Date,
    CONSTRAINT FK_Orders_To_Customers FOREIGN KEY (CustomerId)  REFERENCES Customers (Id)
)

---------------------------
--ON DELETE, ON UPDATE
CREATE TABLE Orders
(
    Id INT PRIMARY KEY IDENTITY,
    CustomerId INT,
    CreatedAt Date,
    FOREIGN KEY (CustomerId) REFERENCES Customers (Id) ON DELETE CASCADE --(NO ACTION, SET NULL, SET DEFAULT)
                                                       ON UPDATE CASCADE --(NO ACTION, SET NULL, SET DEFAULT)
)


