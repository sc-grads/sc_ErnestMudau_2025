use master 
go
create master key encryption
by password ='Abb@s123Abb@s123'
go

use master 
go
create certificate  tdeCerf with subject = 'tde certificate';

use master 
go 
select name , put_key_encryption_type_desc from sys.certificates
where name = 'tedcert'

backup certificate tdeCert to file = 'c:\ABMSQLEncryptionCert.certbak'
with private key
file = 'c:\ABMSQLEncryptionCert.certbak'
encryption by password ='Abb@s123Abb@s123'

USE OurFirstDatabase
GO
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_128
ENCRYPTION BY SERVER CERTIFICATE tdeCert

Alter database OurFirstDatabase set encryption on
use master