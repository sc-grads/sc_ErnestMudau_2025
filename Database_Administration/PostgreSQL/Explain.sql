select username, contents
from users
join comments on comments.user_id = users.id
where username = 'Alyson14'