CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) on DELETE CASCADE
);
--the on delete cascade is for when you are deleting 
--the user , it makes sure that also the photos related 
--to the deleted user are deleted

INSERT INTO photos (url, user_id)
VALUES
	('http://one.jpg', 4),
	('http://two.jpg', 1),
  ('http://25.jpg', 1),
  ('http://36.jpg', 1),
  ('http://754.jpg', 2),
  ('http://35.jpg', 3),
  ('http://256.jpg', 4);