USE [master]
GO
/****** Object:  Database [AirlinesDB]    Script Date: 02/22/2014 13:54:44 ******/
CREATE DATABASE [AirlinesDB] ON  PRIMARY 
( NAME = N'AirlinesDB', FILENAME = N'd:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\AirlinesDB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AirlinesDB_log', FILENAME = N'd:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\AirlinesDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AirlinesDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AirlinesDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AirlinesDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [AirlinesDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [AirlinesDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [AirlinesDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [AirlinesDB] SET ARITHABORT OFF
GO
ALTER DATABASE [AirlinesDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [AirlinesDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [AirlinesDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [AirlinesDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [AirlinesDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [AirlinesDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [AirlinesDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [AirlinesDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [AirlinesDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [AirlinesDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [AirlinesDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [AirlinesDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [AirlinesDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [AirlinesDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [AirlinesDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [AirlinesDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [AirlinesDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [AirlinesDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [AirlinesDB] SET  READ_WRITE
GO
ALTER DATABASE [AirlinesDB] SET RECOVERY FULL
GO
ALTER DATABASE [AirlinesDB] SET  MULTI_USER
GO
ALTER DATABASE [AirlinesDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [AirlinesDB] SET DB_CHAINING OFF
GO
USE [AirlinesDB]
GO
/****** Object:  Table [dbo].[FairChart]    Script Date: 02/22/2014 13:54:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FairChart](
	[FlightID] [nvarchar](10) NOT NULL,
	[BUFair] [decimal](10, 2) NULL,
	[BUSeats] [int] NULL,
	[ECFair] [decimal](10, 0) NULL,
	[ECSeats] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 02/22/2014 13:54:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[Id] [nchar](5) NOT NULL,
	[Name] [varchar](30) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Authentication]    Script Date: 02/22/2014 13:54:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authentication](
	[Username] [nvarchar](25) NOT NULL,
	[Password] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Authentication] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 02/22/2014 13:54:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[Userame] [nvarchar](25) NOT NULL,
	[FirstName] [nvarchar](25) NULL,
	[LastName] [nvarchar](25) NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [nchar](1) NULL,
	[Contact] [bigint] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Userame] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_registerUser]    Script Date: 02/22/2014 13:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_registerUser] 
	-- Add the parameters for the stored procedure here
	@username nvarchar(25),
	@password nvarchar (25)	
AS
BEGIN
	set nocount on;
		insert into Authentication values (@username, @password);	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getCitys]    Script Date: 02/22/2014 13:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getCitys]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Name FROM City;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_validateUser]    Script Date: 02/22/2014 13:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_validateUser]
(
	@name varchar(25), 
	@pass varchar(25)
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE 
	@pwd varchar(25), 
	@ret bit;
	
	-- Add the T-SQL statements to compute the return value here
	SELECT @pwd = password 
	FROM	authentication
	WHERE	username = @name;
	
	IF	(@pwd = @pass)
		SET @ret = 1
	ELSE 
		SET @ret = 0
	--set @ret = 1;
	-- Return the result of the function
	RETURN @ret;

END
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 02/22/2014 13:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Flight](
	[Id] [nvarchar](10) NOT NULL,
	[Company] [varchar](50) NULL,
	[Source] [nchar](5) NOT NULL,
	[Destination] [nchar](5) NOT NULL,
	[DepartureTime] [time](7) NOT NULL,
	[ArrivalTime] [time](7) NOT NULL,
 CONSTRAINT [PK_Flight] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 02/22/2014 13:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](25) NOT NULL,
	[FlightID] [nvarchar](10) NOT NULL,
	[Date] [date] NULL,
	[Class] [nchar](10) NULL,
	[NumberOfSeatsBooked] [int] NULL,
	[TotalCost] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Availablity]    Script Date: 02/22/2014 13:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Availablity](
	[FlightDate] [date] NOT NULL,
	[FlightID] [nvarchar](10) NOT NULL,
	[TotalBusinessClassBooking] [int] NULL,
	[TotalEconomyClassBooking] [int] NULL,
 CONSTRAINT [PK_Availablity] PRIMARY KEY CLUSTERED 
(
	[FlightDate] ASC,
	[FlightID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_addUserInfo]    Script Date: 02/22/2014 13:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_addUserInfo] 
	@username nvarchar(25),
	@FirstName nvarchar(25),
	@LastName nvarchar(25),
	@DateOfBirth date,
	@Gender nchar(1),
	@Contact bigint,
	@Email nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	insert into UserInfo values(@username, @FirstName, @LastName, @DateOfBirth, @Gender, @Contact, @Email);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_validateUser]    Script Date: 02/22/2014 13:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_validateUser]
	-- Add the parameters for the stored procedure here
	@username varchar(25),
	@password varchar(25),
	@ret bit output

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	

    -- Insert statements for procedure here
	SELECT @ret = dbo.fn_validateUser(@username, @password);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_searchFlight2]    Script Date: 02/22/2014 13:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_searchFlight2] 
	-- Add the parameters for the stored procedure here
	@source nchar(5),
	@destination nchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT f.Id, Company, f.source, f.destination, DepartureTime, ArrivalTime, c1.FairPerSeat as BUFair, c1.TotalSeats as BUSeat, c2.FairPerSeat as ECFair , c2.TotalSeats as ECSeats
	FROM Flight f, FairChart c1, FairChart c2
	WHERE f.Source = @source and f.Destination = @destination and c1.CabinType = 'BU' and c2.Cabintype = 'EC'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_searchFlight]    Script Date: 02/22/2014 13:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_searchFlight]
	-- Add the parameters for the stored procedure here
	@source varchar(30),
	@destination varchar(30)
AS	
BEGIN	
	
	DECLARE @src nchar(5);
	DECLARE @dst nchar(5);
	
	SELECT @src = id from City where Name = @source;
	SELECT @dst = id from City where Name = @destination;
	
	SELECT f.Id, Company, @source as 'Source', @destination as Destination, DepartureTime, ArrivalTime, BUFair as BusinessClassFair, BUSeats as BusinessClassTotalSeat, ECFair as EconomicClassFair , ECSeats as EconomyClassTotalSeat
	FROM Flight f, FairChart fc
	WHERE f.Source = @src and f.Destination = @dst and f.ID = fc.FlightID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_searchAvailability]    Script Date: 02/22/2014 13:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_searchAvailability]
	-- Add the parameters for the stored procedure here
	@source nvarchar(30),
	@destination nvarchar(30),
	@deptDate Date
AS
BEGIN
	DECLARE @src nchar(5);
	DECLARE @dst nchar(5);
	
	SELECT @src = id from City where Name = @source;
	SELECT @dst = id from City where Name = @destination;
	
	SELECT f.Id, Company, @source as 'Source', @destination as Destination, DepartureTime, 
	ArrivalTime, c1.FairPerSeat as BusinessClassFair, 
	c1.TotalSeats - a.TotalBusinessClassBooking as BusinessClassAvailableSeat, 
	c2.FairPerSeat as EconomicClassFair , 
	c2.TotalSeats - a.TotalEconomyClassBooking as EconomyClassAvailableSeat
	FROM Flight f, FairChart c1, FairChart c2, Availablity a
	WHERE f.Source = @src and f.Destination = @dst and c1.CabinType = 'BU' and c2.CabinType = 'EC' 
	and a.FlightDate = @deptDate and a.FlightID = f.Id
END
GO
/****** Object:  ForeignKey [FK_User_Authentication]    Script Date: 02/22/2014 13:54:46 ******/
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_User_Authentication] FOREIGN KEY([Userame])
REFERENCES [dbo].[Authentication] ([Username])
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_User_Authentication]
GO
/****** Object:  ForeignKey [FK_Flight_City]    Script Date: 02/22/2014 13:54:58 ******/
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_City] FOREIGN KEY([Source])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_City]
GO
/****** Object:  ForeignKey [FK_Flight_City1]    Script Date: 02/22/2014 13:54:58 ******/
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_City1] FOREIGN KEY([Destination])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_City1]
GO
/****** Object:  ForeignKey [FK_Booking_Authentication]    Script Date: 02/22/2014 13:54:58 ******/
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Authentication] FOREIGN KEY([Username])
REFERENCES [dbo].[Authentication] ([Username])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Authentication]
GO
/****** Object:  ForeignKey [FK_Booking_Flight]    Script Date: 02/22/2014 13:54:58 ******/
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Flight] FOREIGN KEY([FlightID])
REFERENCES [dbo].[Flight] ([Id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Flight]
GO
/****** Object:  ForeignKey [FK_Availablity_Flight1]    Script Date: 02/22/2014 13:54:58 ******/
ALTER TABLE [dbo].[Availablity]  WITH CHECK ADD  CONSTRAINT [FK_Availablity_Flight1] FOREIGN KEY([FlightID])
REFERENCES [dbo].[Flight] ([Id])
GO
ALTER TABLE [dbo].[Availablity] CHECK CONSTRAINT [FK_Availablity_Flight1]
GO
