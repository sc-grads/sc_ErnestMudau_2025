create table accounts (
	id serial primary key,
	name varchar(20) not null,
	balance integer not null
)

insert into accounts(name, balance)
values
('Gia', 100),
('alyson', 100)