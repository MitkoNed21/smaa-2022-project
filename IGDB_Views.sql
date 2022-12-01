create view PostLike as
	select id, [user_id], [post_id] from [Like]
	where parent_type_enum = 1
go

create view CommentLike as
	select id, [user_id], [comment_id] from [Like]
	where parent_type_enum = 2
go

drop view if exists PostLike
drop view if exists CommentLike
go