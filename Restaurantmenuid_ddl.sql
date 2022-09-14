USE restaurent_sra;
GO

CREATE TABLE RestaurantMenuItem (
--This table holds detail Item list served in restaurant
MenuItemID Int Identity(1,1)  Not Null PRIMARY KEY, 
CuisineID Int Not Null FOREIGN KEY REFERENCES Cuisine(CuisineID),
ItemName Nvarchar(100) Not Null UNIQUE,
ItemPrice float
)


DROP TABLE  RestaurantMenuItem;
go

--Create procedure for inserting / Deleting / Updating of data into above table. Atleast add 5-6 item per each Cuisine Names.
--Procedure should accept following Input Parameters.
--1) CuisineID 2) ItemName 3) ItemPrice
--Validation
--1) All the validation shown above as constraints should be achieved through constraints.
--2) Item Price should be greater than 0.

CREATE PROCEDURE USP_RMI_INS (
								@CuisineID Int,
								@ItemName Nvarchar(100),
								@ItemPrice float
			)
AS 
BEGIN
IF  @ItemPrice >0   --2) Item Price should be greater than 0.
BEGIN
INSERT INTO RestaurantMenuItem
( CuisineID,
ItemName,
ItemPrice  )
VALUES ( @CuisineID,@ItemName,@ItemPrice)
END
ELSE
PRINT' ERROR: insert not done, item price MUST NOT B less than 0 '
END


EXECUTE USP_RMI_INS 1,'MARGARETA PIZAA',300
EXECUTE USP_RMI_INS 2,'BLA BLA',0;    --SHOWS ERROR 

SELECT * FROM RestaurantMenuItem

CREATE PROCEDURE USP_RMI_UPDATE (@id INT,@CuisineID Int,@ItemName Nvarchar(100),@ItemPrice float)
AS
BEGIN
UPDATE RestaurantMenuItem
SET     CuisineID=@CuisineID  ,
		ItemName=@ItemName,
		ItemPrice= @ItemPrice WHERE  MenuItemID = @id
 END
       
	 EXECUTE USP_RMI_UPDATE 3,2,'CHOLE KULCHE',390
	
	


	   CREATE PROCEDURE USP_RMI_DEL
	   @id AS INT
	   AS
        BEGIN
            DELETE FROM RestaurantMenuItem
            WHERE  MenuItemID = @id
        END

		EXECUTE  USP_RMI_DEL 12
		SELECT * FROM RestaurantMenuItem