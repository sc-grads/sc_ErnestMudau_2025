CREATE table photos (
  id serial PRIMARY key,
  url varchar(200),
  user_id integer REFERENCES users(id)
  );