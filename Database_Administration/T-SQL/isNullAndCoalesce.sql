select coalesce(myOption, 'No option') as MyOptions
into tblIsCoalesce
from tblExample
go

select isnull(myOption, 'No option') as MyOptions
into tblIsNull
from tblExample
go