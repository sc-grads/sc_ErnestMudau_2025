select * from Inserted
union
select * from deleted
union
select convert(char(5), 'hi') as Greeting
union
select convert(char(11), 'hello there') as GreetingNow
union
select 11
union
select 'abc' as mycolname
union
select 45 as mycolname