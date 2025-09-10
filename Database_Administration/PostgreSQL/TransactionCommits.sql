begin

update accounts
set balance = balance - 50
where name = 'alyson'

select * from accounts

update accounts
set balance = balance + 50
where name = 'Gia'

commit