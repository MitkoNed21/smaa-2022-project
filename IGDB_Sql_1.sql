create database InstagramDB
use InstagramDB
go

drop table if exists [User]
create table [User]
(
	id int identity(1,1) not null primary key,
	username varchar(100) not null,
	[password] varchar(255),
	[display_name] nvarchar(255) not null,
	bio nvarchar(255),
	[profile_image] varchar(255) not null
)
go

drop table if exists Post
create table Post
(
	id int identity(1,1) not null primary key,
	[text] nvarchar(1000),
	shares int not null default 0,
	post_type_enum int not null default 1,
	-- views?
	[user_id] int not null foreign key references [User](id),
	[created_at] timestamp not null
)
go

drop table if exists Upload
create table Upload
(
	id int identity(1,1) not null primary key,
	upload_type_enum int not null default 1,

	[user_id] int not null foreign key references [User](id),
	[post_id] int not null foreign key references [Post](id),

	created_at timestamp not null,
	-- views?
)
go

drop table if exists Comment
create table Comment
(
	id int identity(1,1) not null primary key,
	parent_type_enum int not null default 1,

	[user_id] int not null foreign key references [User](id),
	[post_id] int foreign key references [Post](id),
	[comment_id] int foreign key references Comment(id),

	[text] nvarchar(1000) not null
)
go

drop table if exists [Like]
create table [Like]
(
	id int identity(1,1) not null primary key,
	parent_type_enum int not null default 1,

	[user_id] int not null foreign key references [User](id),
	[post_id] int foreign key references [Post](id),
	[comment_id] int foreign key references Comment(id),
)
go

drop table if exists [Message]
create table [Message]
(
	id int identity(1,1) not null primary key,
	[text] varchar(1000) not null,

	[user_id] int not null foreign key references [User](id),
	[recipient_user_id] int not null foreign key references [User](id),
)
go

drop table if exists UserFollow
create table UserFollow
(
	id int identity(1,1) not null primary key,

	[follower_user_id] int not null foreign key references [User](id),
	[followee_user_id] int not null foreign key references [User](id),
)
go

drop table if exists [View]
create table [View]
(
	id int identity(1,1) not null primary key,
	view_type_enum int not null default 1,

	[viewer_user_id] int not null foreign key references [User](id),

	[post_id] int foreign key references [Post](id),
	[upload_id] int foreign key references [Upload](id),
	[user_id] int foreign key references [User](id),
)
go

drop table if exists UserTag
create table UserTag
(
	id int identity(1,1) not null primary key,
	tag_type_enum int not null default 1,

	[user_id] int not null foreign key references [User](id),
	[post_id] int foreign key references [Post](id),
	[upload_id] int foreign key references [Upload](id),
)
go