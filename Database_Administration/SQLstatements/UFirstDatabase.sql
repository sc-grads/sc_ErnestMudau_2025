USE [OurFirstDatabase]
GO

INSERT INTO [dbo].[personalinfo]
           ([firstName]
           ,[LastName]
           ,[dob]
           ,[ID])
     VALUES
          ('Ronewa','Mudau','01/03/2001',777)
GO


select * from dbo.personalinfo