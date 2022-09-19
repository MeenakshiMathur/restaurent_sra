use restaurent_sra;
go

create table DiningTableTrack(
--This table holds status of the table, whether available / occupied.
DiningTableTrackID Int Identity(1,1) Primary key, 
DiningTableID int Foreign key references DiningTable(DiningTableID),
TableStatus Nvarchar(100)
)

drop table DiningTableTrack;
go

SELECT * FROM DiningTableTrack;

INSERT INTO DiningTableTrack ( DiningTableID,TableStatus) values (2,'unoccupied' )


CREATE NONCLUSTERED INDEX NC_DiningTableTrack_DiningTableID on DiningTableTrack (DiningTableID) INCLUDE (TableStatus)
