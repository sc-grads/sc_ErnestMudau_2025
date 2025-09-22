CREATE TABLE [logmappingdata]
(
[Operation name] varchar(2000),
[Status] varchar(100),
[Event category] varchar(100),
[Level] varchar(100),
[Time] datetimeoffset,
[Event initiated by] varchar(300),
[Resource type] varchar(1000),
[Resource group] varchar(300),
[Resource] varchar(2000)
)