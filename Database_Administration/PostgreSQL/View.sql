CREATE VIEW tags AS (
    SELECT id, created_at, user_id, post_id, 'photo_tag' AS type FROM photo_tags
    UNION ALL
    SELECT id, created_at, user_id, post_id, 'caption_tag' AS type FROM caption_tags
);


select * from tags
select * from  recent_posts

CREATE VIEW recent_posts AS (
    SELECT *
    FROM posts
    ORDER BY created_at DESC
    LIMIT 10
);