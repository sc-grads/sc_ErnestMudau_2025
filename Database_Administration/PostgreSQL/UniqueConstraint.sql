insert into products (name , department, price, weight)
values ('Shirt','Tools',24,1);

select *
from products

update products
set name = 'RED Shirt'
where price = 24

alter table products
add unique (name)