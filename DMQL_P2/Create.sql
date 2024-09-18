-- Drop OrderPromotions Table
DROP TABLE IF EXISTS OrderPromotions;

-- Drop Orders Table
DROP TABLE IF EXISTS Orders;

-- Drop Products Table
DROP TABLE IF EXISTS Products;

-- Drop FulfillmentOptions Table
DROP TABLE IF EXISTS FulfillmentOptions;

-- Drop Promotions Table
DROP TABLE IF EXISTS Promotions;

-- Drop Customers Table
DROP TABLE IF EXISTS Customers;



-- Create Customers Table
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    ShipCity VARCHAR(100),
    ShipState VARCHAR(100),
    ShipPostalCode VARCHAR(20),
    ShipCountry VARCHAR(100)
);

-- Create Promotions Table
CREATE TABLE Promotions (
    PromotionID SERIAL PRIMARY KEY,
    PromotionDetails TEXT
);

-- Create FulfillmentOptions Table
CREATE TABLE FulfillmentOptions (
    FulfillmentID SERIAL PRIMARY KEY,
    ShipServiceLevel VARCHAR(50),
    B2B BOOLEAN,
    FulfilledBy VARCHAR(50)
);

-- Create Products Table
CREATE TABLE Products (
    SKU VARCHAR(50) PRIMARY KEY,
    Style VARCHAR(50),
    Category VARCHAR(50),
    Size VARCHAR(10),
    ASIN VARCHAR(20)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID VARCHAR(50) PRIMARY KEY,
    Date DATE,
    Status VARCHAR(50),
    FulfillmentID INT,
    SalesChannel VARCHAR(50),
    CourierStatus VARCHAR(50),
    Qty INT,
    Currency VARCHAR(10),
    Amount DECIMAL(10, 2),
    CustomerID INT,
    PromotionID INT,
    SKU VARCHAR(50),  -- Added SKU column to link to Products
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,  -- On delete cascade
    FOREIGN KEY (PromotionID) REFERENCES Promotions(PromotionID) ON DELETE SET NULL,  -- Set null on delete
    FOREIGN KEY (FulfillmentID) REFERENCES FulfillmentOptions(FulfillmentID) ON DELETE SET DEFAULT,  -- Set default on delete
    FOREIGN KEY (SKU) REFERENCES Products(SKU) ON DELETE NO ACTION  -- No action on delete
);

-- Create OrderPromotions Table
CREATE TABLE OrderPromotions (
    OrderID VARCHAR(50),
    PromotionID INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,  -- On delete cascade
    FOREIGN KEY (PromotionID) REFERENCES Promotions(PromotionID) ON DELETE NO ACTION  -- No action on delete
);