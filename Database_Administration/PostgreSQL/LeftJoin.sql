select url,username
from photos
left join users on users.id = photos.user_id