CREATE FUNCTION dbo.GetLikesOfPost (@post_id int)
RETURNS int
WITH EXECUTE AS CALLER
AS
BEGIN
    RETURN(
		select count(l.id) from Post p
		join [Like] l on p.id = l.post_id
		group by l.post_id
		having l.post_id = @post_id
	);
END;
GO

-- drop function if exists GetLikesOfPost

select dbo.GetLikesOfPost(23);