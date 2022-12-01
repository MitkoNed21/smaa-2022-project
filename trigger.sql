CREATE TRIGGER SendMessageToFollowee
ON UserFollow
AFTER INSERT
AS BEGIN
	Insert [Message] ([text], [user_id], [recipient_user_id])
	values ('I started following you!', (select followee_user_id from inserted), (select follower_user_id from inserted))
END 
GO 