-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouse (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    Address VARCHAR(50),
    CountryID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

CREATE TABLE Product (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT AUTO_INCREMENT,
    ProductID INT,
    WarehouseAmount INT,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(ID) ON DELETE NO ACTION,
    FOREIGN KEY (ProductID) REFERENCES Product(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (Name) VALUES ('Country1'), ('Country2');

INSERT INTO Product (Name) VALUES ('AwersomeProduct');

INSERT INTO Warehouse (Name, Address, CountryID)
VALUES
    ('Warehouse-1', 'City-1, Street-1', 1),
    ('Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO ProductInventory (ProductID, WarehouseAmount, WarehouseID)
VALUES
    (1, 2, 1),
    (1, 5, 2);
