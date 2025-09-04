alter table products
alter column price
set default 999

insert into products (name , department, weight)
values ('Gloves','Tools',5);

select *
from products