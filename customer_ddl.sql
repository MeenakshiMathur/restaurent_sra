

ALTER TABLE Customer
					(CustomerID INT Identity(1,1) NOT NULL PRIMARY KEY ,
					RestaurantID INT  Not Null Foreign key references Restaurant(RestaurantID),
					CustomerName Nvarchar(100) Not Null ,
					Mobileno Nvarchar(10) Not Null UNIQUE )

					select * from Customer

ALTER PROCEDURE USP_Cust_ins( 
								@RestaurantID INT,
								@CustomerName Nvarchar(100),
								@Mobileno Nvarchar(10) )
AS												  
BEGIN
IF @CustomerName LIKE '%[^a-zA-Z]%' AND LEN(@CustomerName)>10 and @Mobileno LIKE  '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' 
BEGIN 
INSERT INTO Customer(RestaurantID ,CustomerName ,Mobileno)
            VALUES     ( @RestaurantID ,@CustomerName,@Mobileno    )
        END
		ELSE
	PRINT 'PH NUM SHUD BE 10 DIG';
	PRINT 'THERE MUST BE NO SPECIAL CHARACTERS IN CUSTOMER NAME AND IT SHOULD BE MORE THAN 10 CHARACTERS';
	END


CREATE NONCLUSTERED INDEX NC_Bills_RestaurantID on Customer (RestaurantID) INCLUDE (CustomerName,MobileNo);



CREATE PROCEDURE USP_Cust_update( @RestaurantID INT,@CustomerName Nvarchar(100),@Mobileno Nvarchar(10) )
AS												  
BEGIN 
UPDATE Customer
SET Mobileno=@Mobileno
WHERE RestaurantID=@RestaurantID AND CustomerName=@CustomerName
END



EXECUTE  USP_Cust_ins 10,'CHANDAN RAJWADA','9997890234'

SELECT * FROM Restaurant;
SELECT * FROM Customer;