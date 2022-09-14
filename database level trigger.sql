--create table test_trigger();
--Database Trigger.
--Create database level trigger to record history of all the database changes made during project development
CREATE TABLE ddl_changelog (PostTime DATETIME, DB_User NVARCHAR(100), Event NVARCHAR(100), TSQL NVARCHAR(2000));  
GO  
CREATE TRIGGER ddl_log1   
ON DATABASE   
FOR DDL_DATABASE_LEVEL_EVENTS   
AS  
DECLARE @data XML  
SET @data = EVENTDATA()  
INSERT ddl_changelog   
   (PostTime, DB_User, Event, TSQL)   
   VALUES   
   (GETDATE(),   
   CONVERT(NVARCHAR(100), CURRENT_USER),   
   @data.value('(/EVENT_INSTANCE/EventType)[1]', 'NVARCHAR(100)'),   
   @data.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'NVARCHAR(2000)') ) ;  
GO  
--Test the trigger.  
CREATE TABLE TestTable (a INT);  
alter table TestTable ADD Email varchar(255);

DROP TABLE TestTable ;  
GO  
SELECT * FROM ddl_changelog ;  
GO  
--Drop the trigger.  
DROP TRIGGER ddl_log1
ON DATABASE;  
GO  
--Drop table ddl_log.  
DROP TABLE ddl_changelog;  
GO  