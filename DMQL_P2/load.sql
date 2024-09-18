INSERT INTO Customers (ShipCity, ShipState, ShipPostalCode, ShipCountry)
SELECT DISTINCT ship_city, ship_state, ship_postal_code, ship_country
FROM Amazon_sales_table;

-- select * from customers;

-- Insert Data into Promotions Table
INSERT INTO Promotions (PromotionDetails)
SELECT DISTINCT TRIM(promotion_id)
FROM Amazon_sales_table a, unnest(string_to_array(a.promotion_ids, ',')) AS promotion_id;

-- select * from Promotions;

-- Insert Data into FulfillmentOptions Table
INSERT INTO FulfillmentOptions (ShipServiceLevel, B2B, FulfilledBy)
SELECT DISTINCT ship_service_level, b2b, fulfilled_by
FROM Amazon_sales_table;

-- select * from FulfillmentOptions;

-- Insert Data into Products Table
INSERT INTO Products (SKU, Style, Category, Size, ASIN)
SELECT DISTINCT sku, style, category, size, asin
FROM Amazon_sales_table
ON CONFLICT (SKU) DO NOTHING;

-- select * from Products;
-- Insert Data into Orders Table
INSERT INTO Orders (OrderID, Date, Status, FulfillmentID, SalesChannel, CourierStatus, Qty, Currency, Amount, CustomerID, PromotionID, SKU)
SELECT 
    order_id, 
    order_date, 
    status, 
    (SELECT FulfillmentID FROM FulfillmentOptions 
     WHERE COALESCE(ShipServiceLevel, '') = COALESCE(Amazon_sales_table.ship_service_level, '') 
       AND COALESCE(B2B, FALSE) = COALESCE(Amazon_sales_table.b2b, FALSE) 
       AND COALESCE(FulfilledBy, '') = COALESCE(Amazon_sales_table.fulfilled_by, '')), 
    sales_channel, 
    courier_status, 
    quantity, 
    currency, 
    amount, 
    (SELECT CustomerID FROM Customers 
     WHERE COALESCE(ShipCity, '') = COALESCE(Amazon_sales_table.ship_city, '') 
       AND COALESCE(ShipState, '') = COALESCE(Amazon_sales_table.ship_state, '') 
       AND COALESCE(ShipPostalCode, '') = COALESCE(Amazon_sales_table.ship_postal_code, '') 
       AND COALESCE(ShipCountry, '') = COALESCE(Amazon_sales_table.ship_country, '')), 
    (SELECT PromotionID FROM Promotions WHERE PromotionDetails = Amazon_sales_table.promotion_ids), 
    sku
FROM Amazon_sales_table
ON CONFLICT (OrderID) DO NOTHING;

-- select * from orders;

-- Insert Data into OrderPromotions Table
INSERT INTO OrderPromotions (OrderID, PromotionID)
SELECT 
    a.order_id,
    p.PromotionID
FROM 
    Amazon_sales_table a
JOIN 
    unnest(string_to_array(a.promotion_ids, ',')) AS promotion_id ON true
JOIN 
    Promotions p ON TRIM(promotion_id) = p.PromotionDetails;

select count(*) from OrderPromotions where orderid='171-9198151-1101146';
-- select * from FulfillmentOptions;
