/*
Created		11/11/2020
Modified		1/7/2021
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/

--Create database ClothingStore
--Use ClothingStore

Create table [Product]
(
	[ProductId] Integer NOT NULL,
	[ProductCategoryId] Integer NOT NULL,
	[ProductCode] Varchar(10) NULL,
	[ProductName] Nvarchar(100) NULL,
	[MetaTitle] Nvarchar(100) NULL,
	[Color] Nvarchar(50) NULL,
	[Size] Varchar(5) NULL,
	[Description] Nvarchar(500) NULL,
	[Price] Decimal(18,2) NULL,
	[PromotionPrice] Decimal(18,2) NULL,
	[View] Integer NULL,
	[Classification] Nvarchar(50) NULL,
	[Status] Bit NULL,
Primary Key ([ProductId])
) 
go

Create table [Feedback]
(
	[FeedbackId] Integer NOT NULL,
	[UserId] Integer NOT NULL,
	[Name] Nvarchar(50) NULL,
	[PhoneNumber] Varchar(11) NULL,
	[Email] Varchar(50) NULL,
	[SentDate] Datetime NULL,
	[Content] Nvarchar(1000) NULL,
	[Status] Bit NULL,
Primary Key ([FeedbackId])
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

Create table [ProductCategory]
(
	[ProductCategoryId] Integer NOT NULL,
	[ProductCategoryName] Nvarchar(100) NULL,
Primary Key ([ProductCategoryId])
) 
go

Create table [Slide]
(
	[SlideId] Integer NOT NULL,
	[ImageName] Nvarchar(100) NULL,
	[Link] Varchar(100) NULL,
	[Description] Nvarchar(100) NULL,
Primary Key ([SlideId])
) 
go

Create table [User]
(
	[UserId] Integer NOT NULL,
	[Username] Varchar(50) NOT NULL,
	[Password] Varchar(20) NOT NULL,
	[Name] Nvarchar(50) NULL,
	[BirthDay] Datetime NULL,
	[Address] Nvarchar(100) NULL,
	[Email] Varchar(50) NULL,
	[PhoneNumber] Varchar(11) NULL,
	[Points] Integer NULL,
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
	[Discount] Integer NULL,
	[Description] Nvarchar(500) NULL,
Primary Key ([RoleId])
) 
go

Create table [Voucher]
(
	[VoucherId] Integer NOT NULL,
	[VoucherCode] Varchar(10) NULL,
	[Type] Nvarchar(50) NULL,
	[Description] Nvarchar(100) NULL,
	[Discount] Integer NULL,
	[Percent] Integer NULL,
Primary Key ([VoucherId])
) 
go


Alter table [ProductImage] add  foreign key([ProductId]) references [Product] ([ProductId])  on update no action on delete no action 
go
Alter table [OrderDetail] add  foreign key([ProductId]) references [Product] ([ProductId])  on update no action on delete no action 
go
Alter table [New] add  foreign key([NewCategoryId]) references [NewCategory] ([NewCategoryId])  on update no action on delete no action 
go
Alter table [Product] add  foreign key([ProductCategoryId]) references [ProductCategory] ([ProductCategoryId])  on update no action on delete no action 
go
Alter table [Order] add  foreign key([UserId]) references [User] ([UserId])  on update no action on delete no action 
go
Alter table [Feedback] add  foreign key([UserId]) references [User] ([UserId])  on update no action on delete no action 
go
Alter table [OrderDetail] add  foreign key([OrderId]) references [Order] ([OrderId])  on update no action on delete no action 
go
Alter table [User] add  foreign key([RoleId]) references [Role] ([RoleId])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


