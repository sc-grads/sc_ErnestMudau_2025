Update products
set price = 9999
where price is null

select *
from products

alter table products
alter column price
set not null