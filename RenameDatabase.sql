USE master;  
GO  

-- close any open connections and prevent other users from connecting --

ALTER DATABASE SoftUni SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

ALTER DATABASE SoftUni MODIFY NAME = Company ;
GO  

ALTER DATABASE Company SET MULTI_USER
GO