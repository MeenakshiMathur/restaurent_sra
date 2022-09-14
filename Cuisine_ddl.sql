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
