USE [master]
GO
/****** Object:  Database [AddressBook]    Script Date: 2020/01/28 10:47:31 ******/
CREATE DATABASE [AddressBook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AddressBook', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AddressBook.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AddressBook_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AddressBook_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AddressBook] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AddressBook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AddressBook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AddressBook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AddressBook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AddressBook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AddressBook] SET ARITHABORT OFF 
GO
ALTER DATABASE [AddressBook] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AddressBook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AddressBook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AddressBook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AddressBook] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AddressBook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AddressBook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AddressBook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AddressBook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AddressBook] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AddressBook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AddressBook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AddressBook] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AddressBook] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AddressBook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AddressBook] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AddressBook] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AddressBook] SET RECOVERY FULL 
GO
ALTER DATABASE [AddressBook] SET  MULTI_USER 
GO
ALTER DATABASE [AddressBook] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AddressBook] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AddressBook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AddressBook] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AddressBook] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AddressBook', N'ON'
GO
ALTER DATABASE [AddressBook] SET QUERY_STORE = OFF
GO
USE [AddressBook]
GO
/****** Object:  Table [dbo].[ContactNumbers]    Script Date: 2020/01/28 10:47:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactNumbers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactNumber] [nvarchar](24) NOT NULL,
	[ContactId] [int] NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Email]    Script Date: 2020/01/28 10:47:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email](
	[EmailId] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[ContactId] [int] NOT NULL,
 CONSTRAINT [PK_Email] PRIMARY KEY CLUSTERED 
(
	[EmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContacts]    Script Date: 2020/01/28 10:47:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContacts](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContactNumbers]  WITH CHECK ADD FOREIGN KEY([ContactId])
REFERENCES [dbo].[tblContacts] ([ContactId])
GO
ALTER TABLE [dbo].[Email]  WITH CHECK ADD  CONSTRAINT [FK_Email_User_UserID] FOREIGN KEY([ContactId])
REFERENCES [dbo].[tblContacts] ([ContactId])
GO
ALTER TABLE [dbo].[Email] CHECK CONSTRAINT [FK_Email_User_UserID]
GO
/****** Object:  StoredProcedure [dbo].[spAddNewContact]    Script Date: 2020/01/28 10:47:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddNewContact]
@FirstName nvarchar(50),
@LastName nvarchar(50),
@ContactNumber nvarchar(24),
@EmailAddress nvarchar(50)

AS

BEGIN

SET NOCOUNT ON;

INSERT INTO tblContacts(FirstName,LastName) VALUES(@FirstName,@LastName)

Declare @ContactId int = SCOPE_IDENTITY()

INSERT INTO ContactNumbers(ContactNumber, ContactId) VALUES(@ContactNumber, @ContactId)

INSERT INTO Email(EmailAddress, ContactId) VALUES(@EmailAddress, @ContactId)

END
GO
/****** Object:  StoredProcedure [dbo].[spAddNewContactNumber]    Script Date: 2020/01/28 10:47:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddNewContactNumber]
@ContactId int,
@ContactNumber nvarchar(24)

AS

BEGIN

SET NOCOUNT ON;

INSERT INTO ContactNumbers(ContactNumber,ContactId) VALUES(@ContactNumber,@ContactId)

END
GO
/****** Object:  StoredProcedure [dbo].[spAddNewEmail]    Script Date: 2020/01/28 10:47:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddNewEmail]
@ContactId int,
@EmailAddress nvarchar(50)

AS

BEGIN

SET NOCOUNT ON;

INSERT INTO Email(EmailAddress,ContactId) VALUES(@EmailAddress,@ContactId)

END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteContact]    Script Date: 2020/01/28 10:47:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spDeleteContact]

@ContactId int

AS

BEGIN

SET NOCOUNT ON;

Delete from ContactNumbers where ContactId= @ContactId

Delete from Email where ContactId=@ContactId

DELETE FROM tblContacts WHERE ContactId=@ContactId

END

GO
/****** Object:  StoredProcedure [dbo].[spDeleteContactNumber]    Script Date: 2020/01/28 10:47:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteContactNumber]
@Id int

AS

BEGIN

SET NOCOUNT ON;

DELETE FROM ContactNumbers where Id=@Id

END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteEmailAddress]    Script Date: 2020/01/28 10:47:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteEmailAddress]

@EmailId int

AS

BEGIN

DELETE FROM Email where EmailId=@EmailId

END
GO
/****** Object:  StoredProcedure [dbo].[spGetContactNumberByContactId]    Script Date: 2020/01/28 10:47:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetContactNumberByContactId]
@ContactId int
AS
BEGIN
SET NOCOUNT ON;
SELECT
	  Id,
	  ContactNumber
	  FROM ContactNumbers
	  where ContactId=@ContactId
END
	  
	   
	  
     
GO
/****** Object:  StoredProcedure [dbo].[spGetContacts]    Script Date: 2020/01/28 10:47:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetContacts]
AS
BEGIN
SET NOCOUNT ON;

SELECT ContactId, FirstName, LastName From tblContacts

END
GO
/****** Object:  StoredProcedure [dbo].[spGetContactsById]    Script Date: 2020/01/28 10:47:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetContactsById]
@ContactId int
AS
BEGIN
SET NOCOUNT ON;
SELECT
	  ContactId,
      FirstName,
	  LastName
	  
	  FROM tblContacts 
	  
      where ContactId=@ContactId
	   ORDER BY FirstName ASC 
end
GO
/****** Object:  StoredProcedure [dbo].[spGetEmailAddressByContactId]    Script Date: 2020/01/28 10:47:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetEmailAddressByContactId]
@ContactId int
AS
BEGIN
SET NOCOUNT ON;
SELECT
	  EmailId,
	  EmailAddress
	  FROM Email
	  where ContactId=@ContactId
END
	  
	   
	  
     
GO
/****** Object:  StoredProcedure [dbo].[spUpdateContact]    Script Date: 2020/01/28 10:47:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdateContact]
@ContactId int,
@FirstName nvarchar(50),
@LastName nvarchar(50)

AS

BEGIN

SET NOCOUNT ON;

UPDATE tblContacts set FirstName=@FirstName,LastName=@LastName where ContactId=@ContactId

END
GO
USE [master]
GO
ALTER DATABASE [AddressBook] SET  READ_WRITE 
GO
