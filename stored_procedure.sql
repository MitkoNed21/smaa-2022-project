CREATE PROCEDURE dbo.getPostsForUser
    @id int
AS
    SELECT p.id as post_id,
		   dbo.GetLikesOfPost(p.id) as post_likes,
		   p.shares,
		   p.post_type_enum,
		   cast(DateAdd(second, p.created_at, '1970-01-01') as smalldatetime) as created_at,
		   u.username,
		   u.display_name
	from Post p
	join [User] u on u.id = p.[user_id]
    WHERE p.[user_id] = u.id AND u.id = @id
GO

-- drop procedure if exists dbo.getPostsForUser

EXECUTE dbo.getPostsForUser @id = 222
EXECUTE dbo.getPostsForUser @id = 113
EXECUTE dbo.getPostsForUser @id = 44
EXECUTE dbo.getPostsForUser @id = 99
EXECUTE dbo.getPostsForUser @id = 93
EXECUTE dbo.getPostsForUser @id = 37
EXECUTE dbo.getPostsForUser @id = 18