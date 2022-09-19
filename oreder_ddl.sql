use restaurent_sra;

--This table holds data related to orders given by Customer

CREATE TABLE Ordertable(
					OrderID INT Identity(1,1) PRIMARY KEY,
					OrderDate DATETIME Not null,
					RestaurantID INT Not Null FOREIGN KEY REFERENCES Restaurant(RestaurantID ),
					MenuITemID INT Not Null FOREIGN KEY REFERENCES RestaurantMenuItem(MenuItemID),
					ItemQuantity INT Not null ,
					OrderAmount FLOAT Not null,
					DiningTableId INT Not Null FOREIGN KEY REFERENCES DiningTable(DiningTableId)

)
Go

CREATE NONCLUSTERED INDEX NC_Order_RestaurantID on Ordertable (RestaurantID) INCLUDE (OrderDate, ItemQuantity, OrderAmount)

CREATE NONCLUSTERED INDEX NC_Order_MenuITemID on Ordertable (MenuITemID) INCLUDE (OrderDate, ItemQuantity, OrderAmount)

CREATE NONCLUSTERED INDEX NC_Order_DiningTableId on Ordertable (DiningTableId) INCLUDE (OrderDate, ItemQuantity, OrderAmount)

SELECT OrderAmount,RestaurantID,YEAR(OrderDate) FROM Ordertable


CREATE PROCEDURE USP_ORDER_INS ( @RestaurantID INT,@MenuItemID INT,@ItemQuantity INT, @DiningTableID INT)
AS
IF @ItemQuantity>0
BEGIN
DECLARE @OrderDate DATE,@OrderAmount FLOAT
DECLARE @ItemPrice float;
SET @ItemPrice = (SELECT ItemPrice FROM RestaurantMenuItem WHERE MenuItemID=@MenuITemID) ;
SET @OrderAmount= (@ItemQuantity* @ItemPrice);
PRINT  @OrderAmount;
SET @OrderDate=GETDATE();
PRINT @OrderDate;
INSERT INTO Ordertable( OrderDate ,RestaurantID,MenuItemID,ItemQuantity ,OrderAmount ,DiningTableID)
            VALUES (@OrderDate,@RestaurantID, @MenuItemID, @ItemQuantity ,@OrderAmount , @DiningTableID)
UPDATE DiningTableTrack 
			SET TableStatus='occoupied'
			WHERE DiningTableID =@DiningTableID 
END


drop table Ordertable;
go

SELECT * FROM Ordertable

--REPORT 3
CREATE PROCEDURE USP_ORDERAMT_REST_YEAR
AS
BEGIN
SELECT SUM(Orderamount), RestaurantID, YEAR(OrderDate)
FROM Ordertable
GROUP BY RestaurantID,YEAR(OrderDate)
END


--REPORT 4 Create procedure to list daywise, tablewise total order amount.

CREATE PROCEDURE USP_ORDERAMT_DAY_TABLE
AS
BEGIN
SELECT SUM(Orderamount), DAY(OrderDate),DiningTableId
FROM Ordertable
GROUP BY DAY(OrderDate),DiningTableId
END


--REPORT 5 Create view to list cusinewise item details.


CREATE VIEW CUISINE_ITEMS_DETAILS
AS
SELECT Cuisine.CuisineID,RestaurantMenuItem.ItemName,RestaurantMenuItem.ItemPrice
FROM
  Cuisine JOIN RestaurantMenuItem
ON RestaurantMenuItem.CuisineID = Cuisine.CuisineID



SELECT * FROM restaurent_sra.dbo.Order;

SELECT * FROM Ordertable
SELECT * FROM Order_table




