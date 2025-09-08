select pg_size_pretty(pg_relation_size ('users'));
select pg_size_pretty(pg_relation_size ('users_username_idx'))