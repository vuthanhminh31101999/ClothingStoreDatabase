use master
IF exists(select * from sysdatabases where name='ClothingStore')
	drop database ClothingStore
go
create database ClothingStore
go
use ClothingStore

Create table [ProductCategory]
(
	[ProductCategoryId] Integer NOT NULL,
	[ProductCategoryName] Nvarchar(100) NULL,
Primary Key ([ProductCategoryId])
) 
go

Create table [Product]
(
	[ProductId] Integer NOT NULL,
	[ProductCategoryId] Integer NOT NULL,
	[ProductCode] Char(10) NULL,
	[ProductName] Nvarchar(100) NULL,
	[MetaTitle] Nvarchar(100) NULL,
	[Color] Nvarchar(50) NULL,
	[Size] Char(5) NULL,
	[Description] Nvarchar(500) NULL,
	[Price] Decimal(18,2) NULL,
	[PromotionPrice] Decimal(18,2) NULL,
	[View] Integer NULL,
	[Status] Bit NULL,
Primary Key ([ProductId])
) 
go

Create table [ProductImage]
(
	[ImageId] Integer NOT NULL,
	[ImageName] Nvarchar(100) NULL,
	[ProductId] Integer NOT NULL,
Primary Key ([ImageId])
) 
go

Create table [Role]
(
	[RoleId] Integer NOT NULL,
	[RoleName] Nvarchar(100) NULL,
	[Description] Nvarchar(500) NULL,
Primary Key ([RoleId])
) 
go

Create table [User]
(
	[UserId] Integer NOT NULL,
	[Username] Char(50) NOT NULL,
	[Password] Char(20) NOT NULL,
	[Name] Nvarchar(50) NULL,
	[BirthDay] Datetime NULL,
	[Address] Nvarchar(100) NULL,
	[Email] Char(50) NULL,
	[PhoneNumber] Char(11) NULL,
	[RoleId] Integer NOT NULL,
	[Status] Bit NULL,
Primary Key ([UserId])
) 
go

Create table [Order]
(
	[OrderId] Integer NOT NULL,
	[UserId] Integer NOT NULL,
	[OrderDate] Datetime NULL,
	[DeliveryPhoneNumber] Char(11) NULL,
	[DeliveryAddress] Nvarchar(100) NULL,
	[DeliveryStatus] Nvarchar(50) NULL,
Primary Key ([OrderId])
) 
go

Create table [OrderDetail]
(
	[OrderDetailId] Integer NOT NULL,
	[ProductId] Integer NOT NULL,
	[OrderId] Integer NOT NULL,
	[Amount] Integer NULL,
	[ProductPrice] Decimal(18,2) NULL,
	[ProductPromotionPrice] Decimal(18,2) NULL,
Primary Key ([OrderDetailId])
) 
go

Create table [Feedback]
(
	[FeedbackId] Integer NOT NULL,
	[UserId] Integer NOT NULL,
	[Name] Nvarchar(50) NULL,
	[PhoneNumber] Char(11) NULL,
	[Email] Char(50) NULL,
	[SentDate] Datetime NULL,
	[Content] Char(1) NULL,
	[Status] Bit NULL,
Primary Key ([FeedbackId])
) 
go

Create table [Slide]
(
	[SlideId] Integer NOT NULL,
	[ImageName] Nvarchar(100) NULL,
	[Link] Char(100) NULL,
	[Description] Nvarchar(100) NULL,
Primary Key ([SlideId])
) 
go

Create table [NewCategory]
(
	[NewCategoryId] Integer NOT NULL,
	[NewCategoryName] Nvarchar(100) NULL,
Primary Key ([NewCategoryId])
) 
go

Create table [New]
(
	[NewId] Integer NOT NULL,
	[NewCategoryId] Integer NOT NULL,
	[Title] Nvarchar(100) NULL,
	[MetaTitle] Nvarchar(100) NULL,
	[Description] Nvarchar(500) NULL,
	[NewImage] Nvarchar(100) NULL,
	[View] Integer NULL,
	[Status] Bit NULL,
Primary Key ([NewId])
) 
go

Alter table [Product] add  foreign key([ProductCategoryId]) references [ProductCategory] ([ProductCategoryId])  on update no action on delete no action 
go

Alter table [ProductImage] add  foreign key([ProductId]) references [Product] ([ProductId])  on update no action on delete no action 
go

Alter table [User] add  foreign key([RoleId]) references [Role] ([RoleId])  on update no action on delete no action 
go

Alter table [Order] add  foreign key([UserId]) references [User] ([UserId])  on update no action on delete no action 
go

Alter table [OrderDetail] add  foreign key([ProductId]) references [Product] ([ProductId])  on update no action on delete no action 
go

Alter table [OrderDetail] add  foreign key([OrderId]) references [Order] ([OrderId])  on update no action on delete no action 
go

Alter table [Feedback] add  foreign key([UserId]) references [User] ([UserId])  on update no action on delete no action 
go

Alter table [New] add  foreign key([NewCategoryId]) references [NewCategory] ([NewCategoryId])  on update no action on delete no action 
go

