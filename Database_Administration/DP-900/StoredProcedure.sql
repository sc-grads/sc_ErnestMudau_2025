CREATE PROCEDURE ChangeAge
	@CustomerID INT,
	@NewAge INT
AS
UPDATE Customers
SET age = @NewAge
WHERE CustomerId = @CustomerID