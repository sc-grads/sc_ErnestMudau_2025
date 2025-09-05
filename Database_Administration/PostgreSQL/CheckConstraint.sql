alter table products
add check (price > 0)

insert into products (name , department, price, weight)
values ('belt','house',-20,1);