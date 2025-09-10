update accounts
set balance = 100

begin
update accounts
set balance = balance - 50
where name = 'alyson'

select * from accounts

rollback