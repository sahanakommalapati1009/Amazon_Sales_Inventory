DELETE FROM Orders WHERE OrderID = '171-9198151-1101146';

select * from Orders where orderid = '171-9198151-1101146'

INSERT INTO Orders (OrderID, Date, Status, SalesChannel, CourierStatus, Qty, Currency, Amount, CustomerID, SKU)
VALUES ('171-9198151-1101146', '2022-04-30', 'Unshipped', 'Merchant', 'Amazon.in', 1, 'INR', 406.00, 1, 
		'JNE3781-KR-XXXL');

select * from Orders where orderid = '171-9198151-1101146'

UPDATE Orders SET Status = 'Shipped' WHERE OrderID = '171-9198151-1101146';

------------------------------------
INSERT INTO Orders (OrderID, Date, Status, SalesChannel, CourierStatus, Qty, Currency, Amount, CustomerID, SKU)
VALUES ('1', '2022-04-30', 'Unshipped', 'Merchant', 'Amazon.in', 1, 'INR', 406.00, 1, 'JNE3781-KR-XXXL');
select * from Orders where orderid = '1'

INSERT INTO Promotions (PromotionDetails) VALUES ('New Promotion Details');
select * from promotions where promotionDetails = 'New Promotion Details'

UPDATE Orders SET PromotionID = 258 WHERE OrderID = '1';

INSERT INTO orderpromotions(orderid, promotionid) VALUES ('1', '258')

select * from orderpromotions where orderid = '1'

DELETE FROM OrderPromotions WHERE OrderID = '1';
DELETE FROM Orders WHERE OrderID = '1';
DELETE FROM Promotions WHERE PromotionID = 258;
