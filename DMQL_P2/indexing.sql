--- Creating index for customerID and checking cost 
CREATE INDEX idx_customer_id ON Orders(CustomerID);
Explain Analyse SELECT * FROM Orders WHERE CustomerID = 123;

--- Creating index for Category and checking cost 
CREATE INDEX idx_category ON Products(Category);
Explain Analyse SELECT * FROM Products WHERE Category = 'kurta';


-- Drop Indexes
DROP INDEX IF EXISTS idx_customer_id;
DROP INDEX IF EXISTS idx_orders_promotionid;
DROP INDEX IF EXISTS idx_orders_status;

-- Create Indexes on Foreign Keys
CREATE INDEX idx_orders_promotionid ON Orders (PromotionID);
CREATE INDEX idx_customer_id ON Orders(CustomerID);

-- Create Indexes on Filtering Columns
CREATE INDEX idx_orders_status ON Orders (Status);

EXPLAIN ANALYZE
SELECT *
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Promotions p ON o.PromotionID = p.PromotionID
WHERE o.Status = 'Shipped';
