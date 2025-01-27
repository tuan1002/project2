USE [db_HotelManagement]
GO
/****** Object:  Table [dbo].[BookingsOnline]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingsOnline](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[custommerID] [int] NULL,
	[RoomID] [int] NULL,
	[CheckInDate] [date] NULL,
	[CheckOutDate] [date] NULL,
	[Verification] [tinyint] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_BookingsOnline] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Custommer]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Custommer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](100) NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
 CONSTRAINT [PK_Custommer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_Bookings]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_Bookings](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[RoomID] [int] NULL,
	[CheckInDate] [date] NULL,
	[CheckOutDate] [date] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK__db_Booki__73951ACD5DACBC60] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_Events]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_Events](
	[EventID] [int] NOT NULL,
	[EventName] [varchar](100) NOT NULL,
	[Date] [date] NOT NULL,
	[Location] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_Facilities]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_Facilities](
	[FacilityID] [int] IDENTITY(1,1) NOT NULL,
	[FacilityName] [nvarchar](100) NULL,
	[Description] [text] NULL,
	[icon] [nvarchar](100) NULL,
 CONSTRAINT [PK__db_Facil__5FB08B94F3356624] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_Feedback]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_Feedback](
	[FeedbackID] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[BookingID] [int] NULL,
	[Rating] [int] NOT NULL,
	[Comments] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_Floor]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_Floor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Floor] [int] NULL,
 CONSTRAINT [PK_db_Floor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_Payments]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NULL,
	[Amount] [decimal](10, 0) NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[method] [tinyint] NULL,
	[Tax] [int] NULL,
	[Discount] [int] NULL,
 CONSTRAINT [PK__db_Payme__9B556A58ACF18992] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_Rooms]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [int] NULL,
	[Slot] [int] NULL,
	[RoomStatus] [int] NULL,
	[ActiveStatus] [int] NULL,
	[idroomtype] [int] NULL,
	[floorID] [int] NULL,
 CONSTRAINT [PK__db_Rooms__32863919600275BF] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_RoomServices]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_RoomServices](
	[RoomServiceID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NULL,
	[ServiceID] [int] NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [decimal](10, 0) NULL,
	[status] [tinyint] NULL,
	[datetime] [datetime] NULL,
 CONSTRAINT [PK__db_RoomS__A11E84A14AEB46A3] PRIMARY KEY CLUSTERED 
(
	[RoomServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_RoomType]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_RoomType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](100) NULL,
	[PricePerNight] [decimal](10, 0) NULL,
	[bed] [int] NULL,
	[bath] [int] NULL,
	[img] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_db_RoomType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_Services]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_Services](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [varchar](100) NOT NULL,
	[Description] [text] NULL,
	[Price] [decimal](10, 0) NULL,
	[image] [varchar](100) NULL,
 CONSTRAINT [PK__db_Servi__C51BB0EA87177F01] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_Staff]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_Staff](
	[StaffID] [int] NOT NULL,
	[UserID] [int] NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Position] [varchar](50) NOT NULL,
	[Salary] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_Tax]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_Tax](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tax] [int] NULL,
 CONSTRAINT [PK_db_Tax] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_Users]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_Users](
	[UserID] [int] NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[qlKS] [tinyint] NULL,
	[qlWeb] [tinyint] NULL,
	[qlThongKe] [tinyint] NULL,
	[qlSetting] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[end] [date] NULL,
	[start] [date] NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageTypeRoom]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageTypeRoom](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[img] [varchar](100) NULL,
	[idType] [int] NULL,
 CONSTRAINT [PK_ImageTypeRoom] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 4/16/2024 5:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [varchar](50) NULL,
	[slogan] [nvarchar](100) NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BookingsOnline] ON 

INSERT [dbo].[BookingsOnline] ([id], [custommerID], [RoomID], [CheckInDate], [CheckOutDate], [Verification], [status]) VALUES (1, 1, 4, CAST(N'2024-04-17' AS Date), CAST(N'2024-04-18' AS Date), 0, 0)
SET IDENTITY_INSERT [dbo].[BookingsOnline] OFF
GO
SET IDENTITY_INSERT [dbo].[Custommer] ON 

INSERT [dbo].[Custommer] ([CustomerID], [UserID], [FullName], [Email], [Phone]) VALUES (1, N'0333333333', N'Trần Văn B', N'7122002@gmail.com', N'0123456789')
INSERT [dbo].[Custommer] ([CustomerID], [UserID], [FullName], [Email], [Phone]) VALUES (2, N'0333333333', N'Trần Văn B', N'7122002@gmail.com', N'0123456789')
INSERT [dbo].[Custommer] ([CustomerID], [UserID], [FullName], [Email], [Phone]) VALUES (3, N'0333333333', N'Trần Văn B', N'7122002@gmail.com', N'0123456789')
INSERT [dbo].[Custommer] ([CustomerID], [UserID], [FullName], [Email], [Phone]) VALUES (4, N'02132312312', N'Trần Văn xx', N'10022@gmail.com', N'0123456789')
SET IDENTITY_INSERT [dbo].[Custommer] OFF
GO
SET IDENTITY_INSERT [dbo].[db_Bookings] ON 

INSERT [dbo].[db_Bookings] ([BookingID], [CustomerID], [RoomID], [CheckInDate], [CheckOutDate], [status]) VALUES (1, 2, 2, CAST(N'2024-04-16' AS Date), CAST(N'2024-04-19' AS Date), 1)
INSERT [dbo].[db_Bookings] ([BookingID], [CustomerID], [RoomID], [CheckInDate], [CheckOutDate], [status]) VALUES (2, 3, 2, CAST(N'2024-04-16' AS Date), CAST(N'2024-04-18' AS Date), 1)
INSERT [dbo].[db_Bookings] ([BookingID], [CustomerID], [RoomID], [CheckInDate], [CheckOutDate], [status]) VALUES (3, 4, 2, CAST(N'2024-04-16' AS Date), CAST(N'2024-04-17' AS Date), 0)
SET IDENTITY_INSERT [dbo].[db_Bookings] OFF
GO
SET IDENTITY_INSERT [dbo].[db_Floor] ON 

INSERT [dbo].[db_Floor] ([id], [Floor]) VALUES (1, 1)
INSERT [dbo].[db_Floor] ([id], [Floor]) VALUES (2, 2)
INSERT [dbo].[db_Floor] ([id], [Floor]) VALUES (3, 3)
SET IDENTITY_INSERT [dbo].[db_Floor] OFF
GO
SET IDENTITY_INSERT [dbo].[db_Payments] ON 

INSERT [dbo].[db_Payments] ([PaymentID], [BookingID], [Amount], [PaymentDate], [method], [Tax], [Discount]) VALUES (1, 1, CAST(3000000 AS Decimal(10, 0)), CAST(N'2024-04-16T15:28:55.483' AS DateTime), 0, 20, 20)
INSERT [dbo].[db_Payments] ([PaymentID], [BookingID], [Amount], [PaymentDate], [method], [Tax], [Discount]) VALUES (2, 2, CAST(2000000 AS Decimal(10, 0)), CAST(N'2024-04-16T15:31:57.967' AS DateTime), 0, 20, 20)
SET IDENTITY_INSERT [dbo].[db_Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[db_Rooms] ON 

INSERT [dbo].[db_Rooms] ([RoomID], [RoomNumber], [Slot], [RoomStatus], [ActiveStatus], [idroomtype], [floorID]) VALUES (2, 101, 2, 0, 1, 2, 1)
INSERT [dbo].[db_Rooms] ([RoomID], [RoomNumber], [Slot], [RoomStatus], [ActiveStatus], [idroomtype], [floorID]) VALUES (3, 102, 2, 1, 1, 2, 1)
INSERT [dbo].[db_Rooms] ([RoomID], [RoomNumber], [Slot], [RoomStatus], [ActiveStatus], [idroomtype], [floorID]) VALUES (4, 201, 4, 1, 1, 3, 2)
INSERT [dbo].[db_Rooms] ([RoomID], [RoomNumber], [Slot], [RoomStatus], [ActiveStatus], [idroomtype], [floorID]) VALUES (5, 202, 4, 1, 1, 3, 2)
INSERT [dbo].[db_Rooms] ([RoomID], [RoomNumber], [Slot], [RoomStatus], [ActiveStatus], [idroomtype], [floorID]) VALUES (6, 301, 2, 1, 1, 4, 3)
INSERT [dbo].[db_Rooms] ([RoomID], [RoomNumber], [Slot], [RoomStatus], [ActiveStatus], [idroomtype], [floorID]) VALUES (7, 302, 2, 1, 1, 4, 3)
SET IDENTITY_INSERT [dbo].[db_Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[db_RoomType] ON 

INSERT [dbo].[db_RoomType] ([id], [Type], [PricePerNight], [bed], [bath], [img], [Description]) VALUES (2, N'Single', CAST(1000000 AS Decimal(10, 0)), 1, 1, N'main_image3ec9534c-e012-4b1e-91fd-2d35292f6e8d.jpg', N'Phòng đơn')
INSERT [dbo].[db_RoomType] ([id], [Type], [PricePerNight], [bed], [bath], [img], [Description]) VALUES (3, N'Double', CAST(2000000 AS Decimal(10, 0)), 2, 2, N'main_image3ff0de3a-70ce-4fd0-bba2-259a66f8ad94.jpg', N'Phòng đôi')
INSERT [dbo].[db_RoomType] ([id], [Type], [PricePerNight], [bed], [bath], [img], [Description]) VALUES (4, N'VIP', CAST(5000000 AS Decimal(10, 0)), 1, 1, N'main_image9b2d57c0-65fa-4cf0-9a54-052b9b74116a.jpg', N'Phòng Vip')
SET IDENTITY_INSERT [dbo].[db_RoomType] OFF
GO
SET IDENTITY_INSERT [dbo].[db_Tax] ON 

INSERT [dbo].[db_Tax] ([id], [tax]) VALUES (1, 20)
SET IDENTITY_INSERT [dbo].[db_Tax] OFF
GO
INSERT [dbo].[db_Users] ([UserID], [Username], [Password], [qlKS], [qlWeb], [qlThongKe], [qlSetting]) VALUES (1, N'admin', N'admin', 1, 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([id], [name], [end], [start], [discount]) VALUES (1, N'Tuan', CAST(N'2024-04-24' AS Date), CAST(N'2024-04-14' AS Date), 20)
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[ImageTypeRoom] ON 

INSERT [dbo].[ImageTypeRoom] ([id], [img], [idType]) VALUES (6, N'extra_image_5a8c2159-3125-46b2-b1d1-d839bd1d3166.jpg', 2)
INSERT [dbo].[ImageTypeRoom] ([id], [img], [idType]) VALUES (7, N'extra_image_de5c1673-a1de-4778-81ea-0aa80e43183a.jpg', 2)
INSERT [dbo].[ImageTypeRoom] ([id], [img], [idType]) VALUES (8, N'extra_image_3580eba2-477a-444e-bbdd-349a761d0765.jpg', 2)
INSERT [dbo].[ImageTypeRoom] ([id], [img], [idType]) VALUES (9, N'extra_image_ad744dc4-cfc9-4479-a7af-aa003e9c0246.jpg', 2)
INSERT [dbo].[ImageTypeRoom] ([id], [img], [idType]) VALUES (10, N'extra_image_f23b12a7-fea3-42ee-8cc1-9dab047daacc.jpg', 2)
INSERT [dbo].[ImageTypeRoom] ([id], [img], [idType]) VALUES (11, N'extra_image_6d662df7-8022-4535-8d9b-d3ad4d98142a.jpg', 3)
INSERT [dbo].[ImageTypeRoom] ([id], [img], [idType]) VALUES (12, N'extra_image_2d6ecae0-90f6-446b-8ae6-754fdb59d468.jpg', 3)
INSERT [dbo].[ImageTypeRoom] ([id], [img], [idType]) VALUES (13, N'extra_image_94ebf74c-25de-40be-ac47-3b410da89b6c.jpg', 3)
INSERT [dbo].[ImageTypeRoom] ([id], [img], [idType]) VALUES (14, N'extra_image_00d0c2dd-d5e6-41fe-8333-3686985e118c.jpg', 3)
INSERT [dbo].[ImageTypeRoom] ([id], [img], [idType]) VALUES (15, N'extra_image_e4e8a8f9-e0fb-45bc-88c1-5eb78f1c5e85.jpg', 3)
INSERT [dbo].[ImageTypeRoom] ([id], [img], [idType]) VALUES (16, N'extra_image_8c44c9a1-ff08-4476-b4e2-db6b2d4ab218.jpg', 4)
INSERT [dbo].[ImageTypeRoom] ([id], [img], [idType]) VALUES (17, N'extra_image_e1351090-a6f2-4679-be90-4a3109f18fce.jpg', 4)
INSERT [dbo].[ImageTypeRoom] ([id], [img], [idType]) VALUES (18, N'extra_image_47541b62-cfee-4ef1-be5a-375a74da72e8.jpg', 4)
INSERT [dbo].[ImageTypeRoom] ([id], [img], [idType]) VALUES (19, N'extra_image_00bb1eee-48ef-4fb0-8a2d-7c202404b93b.jpg', 4)
INSERT [dbo].[ImageTypeRoom] ([id], [img], [idType]) VALUES (20, N'extra_image_8cc86f42-2070-4a8f-a022-e2d46f22d544.jpg', 4)
SET IDENTITY_INSERT [dbo].[ImageTypeRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([id], [image], [slogan]) VALUES (1, N'Slogan309ece28-86e0-47e6-ae4a-7e3f192cae82.jpg', N'Tạo ra những kỷ niệm đẹp tại nơi chúng tôi')
INSERT [dbo].[Slider] ([id], [image], [slogan]) VALUES (2, N'Slogan90fb2272-bd2e-403a-b9d7-aa1161d6f5e8.jpg', N'Kỳ nghỉ tuyệt vời bắt đầu từ đây')
INSERT [dbo].[Slider] ([id], [image], [slogan]) VALUES (3, N'Slogan72a5bd24-801c-401e-8225-e30ef3bc3926.jpg', N'Chất lượng đích thực, dịch vụ tận tâm')
SET IDENTITY_INSERT [dbo].[Slider] OFF
GO
/****** Object:  Index [UQ__db_Payme__73951ACC8C5FF1E9]    Script Date: 4/16/2024 5:27:29 PM ******/
ALTER TABLE [dbo].[db_Payments] ADD  CONSTRAINT [UQ__db_Payme__73951ACC8C5FF1E9] UNIQUE NONCLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__db_Staff__1788CCAD220187E3]    Script Date: 4/16/2024 5:27:29 PM ******/
ALTER TABLE [dbo].[db_Staff] ADD UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookingsOnline]  WITH CHECK ADD  CONSTRAINT [FK_BookingsOnline_Custommer] FOREIGN KEY([custommerID])
REFERENCES [dbo].[Custommer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingsOnline] CHECK CONSTRAINT [FK_BookingsOnline_Custommer]
GO
ALTER TABLE [dbo].[BookingsOnline]  WITH CHECK ADD  CONSTRAINT [FK_BookingsOnline_db_Rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[db_Rooms] ([RoomID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingsOnline] CHECK CONSTRAINT [FK_BookingsOnline_db_Rooms]
GO
ALTER TABLE [dbo].[db_Bookings]  WITH CHECK ADD  CONSTRAINT [FK_db_Bookings_Custommer1] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Custommer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[db_Bookings] CHECK CONSTRAINT [FK_db_Bookings_Custommer1]
GO
ALTER TABLE [dbo].[db_Bookings]  WITH CHECK ADD  CONSTRAINT [FK_db_Bookings_db_Rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[db_Rooms] ([RoomID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[db_Bookings] CHECK CONSTRAINT [FK_db_Bookings_db_Rooms]
GO
ALTER TABLE [dbo].[db_Feedback]  WITH CHECK ADD  CONSTRAINT [FK__db_Feedba__Booki__59FA5E80] FOREIGN KEY([BookingID])
REFERENCES [dbo].[db_Bookings] ([BookingID])
GO
ALTER TABLE [dbo].[db_Feedback] CHECK CONSTRAINT [FK__db_Feedba__Booki__59FA5E80]
GO
ALTER TABLE [dbo].[db_Feedback]  WITH CHECK ADD  CONSTRAINT [FK_db_Feedback_Custommer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Custommer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[db_Feedback] CHECK CONSTRAINT [FK_db_Feedback_Custommer]
GO
ALTER TABLE [dbo].[db_Payments]  WITH CHECK ADD  CONSTRAINT [FK_db_Payments_db_Bookings] FOREIGN KEY([BookingID])
REFERENCES [dbo].[db_Bookings] ([BookingID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[db_Payments] CHECK CONSTRAINT [FK_db_Payments_db_Bookings]
GO
ALTER TABLE [dbo].[db_Rooms]  WITH CHECK ADD  CONSTRAINT [FK_db_Rooms_db_Floor] FOREIGN KEY([floorID])
REFERENCES [dbo].[db_Floor] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[db_Rooms] CHECK CONSTRAINT [FK_db_Rooms_db_Floor]
GO
ALTER TABLE [dbo].[db_Rooms]  WITH CHECK ADD  CONSTRAINT [FK_db_Rooms_db_RoomType1] FOREIGN KEY([idroomtype])
REFERENCES [dbo].[db_RoomType] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[db_Rooms] CHECK CONSTRAINT [FK_db_Rooms_db_RoomType1]
GO
ALTER TABLE [dbo].[db_RoomServices]  WITH CHECK ADD  CONSTRAINT [FK_db_RoomServices_db_Bookings] FOREIGN KEY([BookingID])
REFERENCES [dbo].[db_Bookings] ([BookingID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[db_RoomServices] CHECK CONSTRAINT [FK_db_RoomServices_db_Bookings]
GO
ALTER TABLE [dbo].[db_RoomServices]  WITH CHECK ADD  CONSTRAINT [FK_db_RoomServices_db_Services1] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[db_Services] ([ServiceID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[db_RoomServices] CHECK CONSTRAINT [FK_db_RoomServices_db_Services1]
GO
ALTER TABLE [dbo].[db_Staff]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[db_Users] ([UserID])
GO
ALTER TABLE [dbo].[ImageTypeRoom]  WITH CHECK ADD  CONSTRAINT [FK_ImageTypeRoom_db_RoomType1] FOREIGN KEY([idType])
REFERENCES [dbo].[db_RoomType] ([id])
GO
ALTER TABLE [dbo].[ImageTypeRoom] CHECK CONSTRAINT [FK_ImageTypeRoom_db_RoomType1]
GO
