explain SELECT *
FROM likes
where created_at < '2013-01-01'

create index likes_created_at_index on likes (created_at)

Explain SELECT *
FROM likes
where created_at > '2013-01-01'