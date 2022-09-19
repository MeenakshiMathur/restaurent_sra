CREATE TABLE Restaurant
( RestaurantID Int Identity(1,1 ) Primary key , 
RestaurantName Nvarchar(200) UNIQUE NOT NULL ,
Address Nvarchar(500) NOT NULL,
MobileNo nvarchar(10) UNIQUE NOT NULL 
)

 DROP TABLE Restaurant;

 

 --Create procedure for inserting / Deleting / Updating of data into above table. Atleast add 2 Restaurant Names.
--Procedure should accept following Input Parameters.
--1) RestaurantName
--2) Address
--3) MobileNo
 CREATE PROCEDURE USP_Restaurant_ins(
                                          @Restaurant_name    VARCHAR(20),
                                          @address     VARCHAR(500),
                                          @Res_mobile     nvarchar(10)  
                                     )
AS
  BEGIN
      IF  @address  LIKE '%_[0,1,2,3,4,5,6,7,8,9]%___%' AND LEN(@address)>10
	  AND  @Res_mobile LIKE  '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' 
	  AND  LEN(@address) >10
           BEGIN
            INSERT INTO Restaurant
                        (RestaurantName,
                         Address,
                         MobileNo
                         )
            VALUES     ( 
                         @Restaurant_name,
                         @address,
                         @Res_mobile     )
        END
	ELSE 
		 Print 'ADDRESS MUST CONTAIN A NUMERIC VALUE';
		 PRINT 'PH NUM SHUD BE 10 DIG';

		 END


		CREATE PROCEDURE USP_Restaurent_Update
		(								  @id AS INT,
                                          @Restaurant_name    VARCHAR(20),
                                          @address     VARCHAR(500),
                                          @Res_mobile     nvarchar(10)  
         )
		AS
        BEGIN
        UPDATE Restaurant
        SET     RestaurantName=@Restaurant_name     ,
                MobileNo=@Res_mobile     ,
                Address= @address 
            WHERE  RestaurantID = @id
        END




      CREATE PROCEDURE USP_Restaurant_Del
	  @id AS INT
	  AS
	  BEGIN
            DELETE FROM Restaurant
            WHERE  RestaurantID = @id
        END
       
  
  

	
	
	SELECT * FROM Restaurant

	




	--used in restaurent view
CREATE PROCEDURE USP_getallrest
AS
BEGIN
SELECT * FROM Restaurant
END

CREATE PROCEDURE USP_getonerest 
@RestaurantID as int
AS
BEGIN
SELECT * FROM  Restaurant WHERE RestaurantID=@RestaurantID
END


