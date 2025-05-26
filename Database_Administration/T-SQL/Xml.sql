DECLARE @x XML;
SET @x = 
'<Shopping ShopperName="Phillip Burton" Weather="Nice">
    <ShoppingTrip ShoppingTripID="L1">
        <Item Cost="5">Bananas</Item>
        <Item Cost="4">Apples</Item>
        <Item Cost="3">Cherries</Item>
    </ShoppingTrip>
    <ShoppingTrip ShoppingTripID="L2">
        <Item>Emeralds</Item>
        <Item>Diamonds</Item>
        <Item>Furniture</Item>
    </ShoppingTrip>
</Shopping>';

-- Optional: preview the XML
SELECT @x;

-- Update the table
UPDATE [dbo].[tblEmployeA] 
SET XMLOutput = @x
WHERE EmployeeNumber = 200;

-- View the result
SELECT * FROM [dbo].[tblEmployeA];