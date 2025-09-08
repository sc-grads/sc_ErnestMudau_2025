--create index on users (username)
--if you want your own index name you do it like this
--create index users_username_idx on users (username)

--drop index users_username_idx

explain analyze select *
from users 
where username = 'Emil30'
