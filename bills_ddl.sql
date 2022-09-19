


CREATE TABLE Bills(
--This table holds billing data1 
BillsID INT Identity(1,1) PRIMARY KEY,
OrderID INT Not nUll FOREIGN KEY REFERENCES Ordertable (OrderID),
RestaurantID INT Not Null FOREIGN KEY REFERENCES Restaurant (RestaurantID),
BillAmount FLOAT Not Null ,
CustomerID INT Not Null FOREIGN KEY REFERENCES customer 

)

CREATE NONCLUSTERED INDEX NC_Bills_RestaurantID on Bills (RestaurantID) INCLUDE (BillAmount)


CREATE NONCLUSTERED INDEX NC_Bills_OrderID on Bills (OrderID) INCLUDE (BillAmount)

CREATE NONCLUSTERED INDEX NC_Bills_CustomerID on Bills (CustomerID) INCLUDE (BillAmount)
