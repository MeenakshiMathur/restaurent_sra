

USE restaurent_sra;
GO
CREATE TABLE DiningTable (
DiningTableID INT  Identity(1,1) NOT NULL PRIMARY KEY,
RestaurantID INT NOT NULL FOREIGN KEY REFERENCES Restaurant(RestaurantID),
Location NVARCHAR(100) NOT NULL UNIQUE
)

CREATE PROCEDURE USP_INS_DiningTable( @RestaurantID Int,@Location Nvarchar(100) )
AS
BEGIN
INSERT INTO DiningTable ( RestaurantID,Location) VALUES (@RestaurantID ,@Location)
END

SELECT * FROM DiningTable
SELECT * FROM Restaurant
EXECUTE USP_INS_DiningTable 3,'3TABONE'
EXECUTE USP_INS_DiningTable 3,'3TABTWO'
EXECUTE USP_INS_DiningTable 3,'3TABTHREE'
EXECUTE USP_INS_DiningTable 3,'3TABFOUR'
EXECUTE USP_INS_DiningTable 3,'3TABFIVE'
EXECUTE USP_INS_DiningTable 3,'3TABSIX'
EXECUTE USP_INS_DiningTable 3,'3TABSEVEN'
EXECUTE USP_INS_DiningTable 3,'3TABEIGHT'

DROP TABLE DiningTable;
  
SELECT *  FROM  DiningTable;

CREATE PROCEDURE USP_Dining_Update 
@Id AS INT
AS
BEGIN  
UPDATE DiningTable
SET Location= '4CENTRE'
where DiningTableID=@Id
END

EXECUTE USP_Dining_Update 1;

CREATE PROCEDURE USP_Dining_DEL
@Id AS INT
AS
BEGIN  
DELETE FROM  DiningTable
where DiningTableID=@Id
END


--REPORT 1

ALTER PROCEDURE USP_VACANT_SEATS @RestaurentID  AS INT
AS
BEGIN
SELECT DiningTable.DiningTableID, DiningTable.RestaurantID, DiningTable.Location, DiningTableTrack.DiningTableTrackID, TableStatus    
FROM DiningTable  JOIN DiningTableTrack ON DiningTable.DiningTableID= DiningTableTrack.DiningTableID
WHERE RestaurantID= @RestaurentID AND TableStatus='VACANT'
END 

--This table holds data related to total available dining tables in restaurant.
EXECUTE USP_VACANT_SEATS 1
SELECT * FROM DiningTableTrack
SELECT * FROM DiningTable

UPDATE  DiningTableTrack SET TableStatus  = 'OCCOUPIED' WHERE DiningTableID= 1 



SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
