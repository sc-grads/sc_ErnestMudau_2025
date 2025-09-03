select url,username
from photos
full join users on users.id = photos.user_id