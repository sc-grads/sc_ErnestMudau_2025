SELECT
    Records.ArrayValue.properties.CsMethod AS [Method],
    Records.ArrayValue.properties.ScStatus AS [Status],
    Records.ArrayValue.properties.CsUriStem AS [URL],
    Records.ArrayValue.properties.CIp AS [IPAddress]
INTO
    [appdb-webdata]
FROM
    webhub w
    CROSS APPLY GetArrayElements(w.records) AS Records 


	CREATE TABLE [webdata]
(
[Method] varchar(20),
[Status] varchar(100),
[URL] varchar(2000),
[IPAddress] varchar(200)
)