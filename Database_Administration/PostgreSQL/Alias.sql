select comments.id AS comment_id,p.id
FROM photos AS p
JOIN comments on p.id = comments.photo_id