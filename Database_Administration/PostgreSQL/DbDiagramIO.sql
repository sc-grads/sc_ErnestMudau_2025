Table users {
    id SERIAL [pk, increment]
    created_at TIMESTAMP
    updated_at TIMESTAMP
    username VARCHAR(30)
    bio varchar(400)
    avatar varchar(200)
    phone varchar(25)
    email varchar(40)
    password varchar(50)
    status Varchar(15)
}

Table posts {
    id SERIAL [pk, increment]
    created_at TIMESTAMP
    updated_at TIMESTAMP
    url VARCHAR(200)
    user_id INTIGER [ref: > users.id]
    caption varchar(240)
    lat real
    lng REAL 
}

Table comments {
    id SERIAL [pk, increment]
    created_at TIMESTAMP
    updated_at TIMESTAMP
    contents VARCHAR(240)
    user_id INTIGER [ref: > users.id]
    post_id INTIGER [ref: > posts.id]
}

table likes {
  id serial [pk, increment]
  created_at timestamp
  user_id integer [ref: > users.id]
  comment_id integer [ref: > comments.id]
  post_id integer [ref: > posts.id]
}

TABLE photo_tags {
  id serial [pk, increment]
  created_at timestamp
  updated_at timestamp
  post_id integer [ref: > posts.id]
  user_id integer [ref: > users.id] 
  x integer
  y integer
}

TABLE caption_tags {
  id serial [pk, increment]
  created_at timestamp
  post_id integer [ref: > posts.id]
  user_id integer [ref: > users.id]
}

table hashtags {
  id serial [pk, increment]
  created_at timestamp
  title varchar(20)
}

table hashtag_posts {
  id serial [pk, increment]
  created_at timestamp
  hashtag_id integer [ref : > hashtags.id]
  post_id integer [ref: > posts.id]
}

table followers {
  id serial [pk, increment]
  created_at timestamp
  leader_id integer [ref: > users.id]
  follower_id integer [ref: > users.id]
}