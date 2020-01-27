USE [AddressBook]
GO
/****** Object:  Table [dbo].[ContactNumbers]    Script Date: 2020/01/27 09:50:34 ******/
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
/****** Object:  Table [dbo].[Email]    Script Date: 2020/01/27 09:50:34 ******/
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
/****** Object:  Table [dbo].[tblContacts]    Script Date: 2020/01/27 09:50:34 ******/
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
SET IDENTITY_INSERT [dbo].[ContactNumbers] ON 

INSERT [dbo].[ContactNumbers] ([Id], [ContactNumber], [ContactId]) VALUES (8, N'2341234', 2)
INSERT [dbo].[ContactNumbers] ([Id], [ContactNumber], [ContactId]) VALUES (9, N'344563456', 4)
INSERT [dbo].[ContactNumbers] ([Id], [ContactNumber], [ContactId]) VALUES (10, N'8908908', 12)
INSERT [dbo].[ContactNumbers] ([Id], [ContactNumber], [ContactId]) VALUES (11, N'8908908', 13)
INSERT [dbo].[ContactNumbers] ([Id], [ContactNumber], [ContactId]) VALUES (12, N'94599888', 4)
INSERT [dbo].[ContactNumbers] ([Id], [ContactNumber], [ContactId]) VALUES (13, N'9492471246', 4)
INSERT [dbo].[ContactNumbers] ([Id], [ContactNumber], [ContactId]) VALUES (14, N'996637', 2)
INSERT [dbo].[ContactNumbers] ([Id], [ContactNumber], [ContactId]) VALUES (18, N'444444', 15)
INSERT [dbo].[ContactNumbers] ([Id], [ContactNumber], [ContactId]) VALUES (19, N'444444', 14)
INSERT [dbo].[ContactNumbers] ([Id], [ContactNumber], [ContactId]) VALUES (20, N'555555', 16)
INSERT [dbo].[ContactNumbers] ([Id], [ContactNumber], [ContactId]) VALUES (21, N'555555', 17)
SET IDENTITY_INSERT [dbo].[ContactNumbers] OFF
SET IDENTITY_INSERT [dbo].[Email] ON 

INSERT [dbo].[Email] ([EmailId], [EmailAddress], [ContactId]) VALUES (1, N'ewrwer', 6)
INSERT [dbo].[Email] ([EmailId], [EmailAddress], [ContactId]) VALUES (2, N'ewrwer', 5)
INSERT [dbo].[Email] ([EmailId], [EmailAddress], [ContactId]) VALUES (8, N'jksdhfkjnhsfd', 12)
INSERT [dbo].[Email] ([EmailId], [EmailAddress], [ContactId]) VALUES (10, N'ramesh@gmail.com', 2)
INSERT [dbo].[Email] ([EmailId], [EmailAddress], [ContactId]) VALUES (17, N'rb.maddineni@gmail.com', 2)
INSERT [dbo].[Email] ([EmailId], [EmailAddress], [ContactId]) VALUES (35, N'rameshm@gmail.com', 2)
INSERT [dbo].[Email] ([EmailId], [EmailAddress], [ContactId]) VALUES (37, N'ram@gmail.com', 2)
INSERT [dbo].[Email] ([EmailId], [EmailAddress], [ContactId]) VALUES (39, N'mani#SDDASD', 1)
INSERT [dbo].[Email] ([EmailId], [EmailAddress], [ContactId]) VALUES (40, N'r@gmail.com', 15)
INSERT [dbo].[Email] ([EmailId], [EmailAddress], [ContactId]) VALUES (41, N'r@gmail.com', 14)
INSERT [dbo].[Email] ([EmailId], [EmailAddress], [ContactId]) VALUES (42, N'rrrrrr', 16)
INSERT [dbo].[Email] ([EmailId], [EmailAddress], [ContactId]) VALUES (43, N'rrrrrr', 17)
SET IDENTITY_INSERT [dbo].[Email] OFF
SET IDENTITY_INSERT [dbo].[tblContacts] ON 

INSERT [dbo].[tblContacts] ([ContactId], [FirstName], [LastName]) VALUES (1, N'Manikanta', N'Mundru')
INSERT [dbo].[tblContacts] ([ContactId], [FirstName], [LastName]) VALUES (2, N'Ramesh', N'Maddinei')
INSERT [dbo].[tblContacts] ([ContactId], [FirstName], [LastName]) VALUES (3, N'Scara', N'Ntubeni')
INSERT [dbo].[tblContacts] ([ContactId], [FirstName], [LastName]) VALUES (4, N'Hello666656', N'World')
INSERT [dbo].[tblContacts] ([ContactId], [FirstName], [LastName]) VALUES (5, N'ewer67', N'ewrew')
INSERT [dbo].[tblContacts] ([ContactId], [FirstName], [LastName]) VALUES (6, N'ewer5567', N'ewrew44')
INSERT [dbo].[tblContacts] ([ContactId], [FirstName], [LastName]) VALUES (12, N'Jaffa', N'Jeofff')
INSERT [dbo].[tblContacts] ([ContactId], [FirstName], [LastName]) VALUES (13, N'Jaffa', N'Jeofff')
INSERT [dbo].[tblContacts] ([ContactId], [FirstName], [LastName]) VALUES (14, N'rrrr', N'rrrr')
INSERT [dbo].[tblContacts] ([ContactId], [FirstName], [LastName]) VALUES (15, N'rrrr', N'rrrr')
INSERT [dbo].[tblContacts] ([ContactId], [FirstName], [LastName]) VALUES (16, N'eeee', N'rrr')
INSERT [dbo].[tblContacts] ([ContactId], [FirstName], [LastName]) VALUES (17, N'eeee', N'rrr')
SET IDENTITY_INSERT [dbo].[tblContacts] OFF
ALTER TABLE [dbo].[ContactNumbers]  WITH CHECK ADD FOREIGN KEY([ContactId])
REFERENCES [dbo].[tblContacts] ([ContactId])
GO
ALTER TABLE [dbo].[Email]  WITH CHECK ADD  CONSTRAINT [FK_Email_User_UserID] FOREIGN KEY([ContactId])
REFERENCES [dbo].[tblContacts] ([ContactId])
GO
ALTER TABLE [dbo].[Email] CHECK CONSTRAINT [FK_Email_User_UserID]
GO
/****** Object:  StoredProcedure [dbo].[spAddNewContact]    Script Date: 2020/01/27 09:50:34 ******/
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
/****** Object:  StoredProcedure [dbo].[spAddNewContactNumber]    Script Date: 2020/01/27 09:50:34 ******/
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
/****** Object:  StoredProcedure [dbo].[spAddNewEmail]    Script Date: 2020/01/27 09:50:34 ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteContact]    Script Date: 2020/01/27 09:50:34 ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteContactNumber]    Script Date: 2020/01/27 09:50:34 ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteEmailAddress]    Script Date: 2020/01/27 09:50:34 ******/
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
/****** Object:  StoredProcedure [dbo].[spGetContactNumberByContactId]    Script Date: 2020/01/27 09:50:34 ******/
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
/****** Object:  StoredProcedure [dbo].[spGetContacts]    Script Date: 2020/01/27 09:50:34 ******/
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
/****** Object:  StoredProcedure [dbo].[spGetContactsById]    Script Date: 2020/01/27 09:50:34 ******/
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
/****** Object:  StoredProcedure [dbo].[spGetEmailAddressByContactId]    Script Date: 2020/01/27 09:50:34 ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateContact]    Script Date: 2020/01/27 09:50:34 ******/
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
