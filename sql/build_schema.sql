use NewsKnowledgeGraph;
go

create table dbo.NewsOrganization
(
	id int not null primary key identity(1,1)
,	short_name nvarchar(128) not null unique
,	[name] nvarchar(max) not null unique
,	main_url nvarchar(max) null
)
;
go

create table dbo.NewsArticle
(
	id int not null primary key identity(1,1)
,	source_fk int not null references dbo.NewsOrganization(id) on delete no action on update no action
,	[url] nvarchar(max) not null unique
,	[published_datetime] datetime null
,	headline nvarchar(max) null
,	subheadline nvarchar(max) null
,	text_content nvarchar(max) null
)
;
go


create table dbo.NewsArticleEntity
(
	id int not null primary key identity(1,1)
,	article_fk int not null references dbo.NewsOrganization(id) on delete no action on update no action
,	[name] nvarchar(max) not null
,	[type] nvarchar(max) not null
)
;
go

create table dbo.NewsArticleEntityRelationship
(
	id int not null primary key identity(1,1)
,	article_fk int not null references dbo.NewsOrganization(id) on delete no action on update no action
,	[head] nvarchar(max) not null
,	[relationship] nvarchar(max) not null
,	[tail] nvarchar(max) not null
)
;
go