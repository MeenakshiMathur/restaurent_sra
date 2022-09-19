USE restaurent_sra;
GO

CREATE TABLE Cuisine (  
CuisineID INT Identity(1,1)  Not Null PRIMARY KEY,

RestaurantID INT FOREIGN KEY REFERENCES Restaurant(RestaurantID),

CuisineName Nvarchar(50) Not Null UNIQUE
);
GO

DROP TABLE Cuisine;
go

--Create procedure for inserting / Deleting / Updating of data into above table. Atleast add 5 Cuisine Names.


CREATE PROCEDURE USP_Cuisine_INSERT( 
@RestaurantID INT,
@CuisineName Nvarchar(50)
 )
AS
  BEGIN
  INSERT INTO Cuisine (RestaurantID, CuisineName)
  VALUES ( @RestaurantID,@CuisineName)
  END
	

  CREATE PROCEDURE USP_Cuisine_UPDATE
  (@Id AS INT,
  @RestaurantID INT,
  @CuisineName Nvarchar(50))
  AS
  BEGIN
  UPDATE Cuisine   SET 	CuisineName= @CuisineName 
  WHERE  RestaurantID = @RestaurantID AND CuisineID= @ID
  END


  CREATE PROCEDURE USP_Cuisine_DEL
  @Id AS INT
  AS
  BEGIN
  DELETE FROM Cuisine
  WHERE CuisineID= @Id
  END



  -- for grid VIEW in webapp
  CREATE PROCEDURE USP_ShowCuisine
  AS
  BEGIN
  SELECT * FROM   Cuisine
  END

  
        
            SELECT *
            FROM   Cuisine
        

		
   EXECUTE    USP_Cuisine_INSERT 1,'ITALIAN'


  
  execute sp_Cus_ins_up  1,'chat'


CREATE NONCLUSTERED INDEX NC_Cuisine_RestaurantID on Cuisine (RestaurantID) INCLUDE (CuisineName)


--Report #2
------------
--2)	Create procedure to get the list of all customers, Order Details and Table they used for dining. 
--Procedure should be written dynamically so that filters can be applied. 
--Procedure should accept @FilterBy & @OrderBy variable to filter and order the data dynamically. 


ALTER PROCEDURE USP_Customer_OrderDetails
AS
BEGIN
SELECT Customer.CustomerID ,
		Customer.CustomerName,
		Ordertable.OrderID,
		Ordertable.OrderDate,
		Ordertable.RestaurantID,
		Ordertable.MenuITemID,
		Ordertable.ItemQuantity,
		Ordertable.OrderAmount,
		Ordertable.DiningTableId
FROM Customer, Ordertable, Bills
WHERE Customer.RestaurantID= Ordertable.RestaurantID 
END


AND Bills.CustomerID=Customer.CustomerID
EXECUTE USP_Customer_OrderDetails


 INSERT INTO dbo.Order VALUES (SELECT * FROM Ordertable);