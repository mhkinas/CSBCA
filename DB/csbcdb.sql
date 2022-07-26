USE [master]
GO
/****** Object:  Database [csbcdb]    Script Date: 8.06.2022 14:08:10 ******/
CREATE DATABASE [csbcdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'csbcdb', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\csbcdb.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'csbcdb_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\csbcdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [csbcdb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [csbcdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [csbcdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [csbcdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [csbcdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [csbcdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [csbcdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [csbcdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [csbcdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [csbcdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [csbcdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [csbcdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [csbcdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [csbcdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [csbcdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [csbcdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [csbcdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [csbcdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [csbcdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [csbcdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [csbcdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [csbcdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [csbcdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [csbcdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [csbcdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [csbcdb] SET  MULTI_USER 
GO
ALTER DATABASE [csbcdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [csbcdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [csbcdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [csbcdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [csbcdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [csbcdb] SET QUERY_STORE = OFF
GO
USE [csbcdb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [csbcdb]
GO
/****** Object:  User [csbc_man]    Script Date: 8.06.2022 14:08:10 ******/
CREATE USER [csbc_man] FOR LOGIN [csbc_man] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[csbc_page]    Script Date: 8.06.2022 14:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_page](
	[id] [int] IDENTITY(18,1) NOT NULL,
	[page_name] [nvarchar](150) NOT NULL,
	[adr_path] [int] NOT NULL,
	[page_data] [nvarchar](max) NULL,
	[page_type] [int] NOT NULL,
	[rec_status] [int] NOT NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_csbc_page] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[csbc_page_link]    Script Date: 8.06.2022 14:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_page_link](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[link_name] [nvarchar](150) NOT NULL,
	[adr_path] [int] NOT NULL,
	[linked_page] [int] NOT NULL,
	[position] [int] NOT NULL,
	[theme] [int] NOT NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_csbc_page_link] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[csbc_path]    Script Date: 8.06.2022 14:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_path](
	[id] [int] IDENTITY(8,1) NOT NULL,
	[path_name] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_csbc_path] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[csbc_position]    Script Date: 8.06.2022 14:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_position](
	[id] [int] IDENTITY(6,1) NOT NULL,
	[pos_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_csbc_position] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[csbc_theme]    Script Date: 8.06.2022 14:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_theme](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[theme_name] [nvarchar](150) NOT NULL,
	[adr_path] [int] NOT NULL,
	[theme_menu] [int] NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_csbc_theme] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[csbc_user]    Script Date: 8.06.2022 14:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_user](
	[id] [int] IDENTITY(7,1) NOT NULL,
	[user_name] [nvarchar](150) NOT NULL,
	[user_code] [nvarchar](30) NOT NULL,
	[user_psw] [nvarchar](300) NULL,
	[user_group] [int] NOT NULL,
	[e_mail] [nvarchar](150) NULL,
	[rec_status] [int] NOT NULL,
	[page_size] [int] NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_csbc_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vt_csbc_page_link]    Script Date: 8.06.2022 14:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vt_csbc_page_link]
AS
SELECT        CONVERT(nvarchar(10), dbo.csbc_page_link.id) as id, dbo.csbc_page_link.link_name, dbo.csbc_path.path_name AS adr_path, dbo.csbc_page.page_name AS linked_page, dbo.csbc_position.pos_name AS position, dbo.csbc_theme.theme_name AS theme, 
                         dbo.csbc_user.user_code AS rec_user, FORMAT(dbo.csbc_page_link.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, dbo.csbc_page_link.rec_date AS rec_date1, dbo.csbc_page_link.rec_date AS rec_date2,
						 dbo.csbc_page_link.id as page_link_id
FROM            dbo.csbc_page_link INNER JOIN
                         dbo.csbc_path ON dbo.csbc_page_link.adr_path = dbo.csbc_path.id INNER JOIN
                         dbo.csbc_page ON dbo.csbc_page_link.linked_page = dbo.csbc_page.id AND dbo.csbc_path.id = dbo.csbc_page.adr_path INNER JOIN
                         dbo.csbc_position ON dbo.csbc_page_link.position = dbo.csbc_position.id INNER JOIN
                         dbo.csbc_user ON dbo.csbc_page_link.rec_user = dbo.csbc_user.id INNER JOIN
                         dbo.csbc_theme ON dbo.csbc_page_link.theme = dbo.csbc_theme.id 
GO
/****** Object:  Table [dbo].[csbc_page_map]    Script Date: 8.06.2022 14:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_page_map](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mapped_page] [int] NOT NULL,
	[theme] [int] NOT NULL,
	[position] [int] NOT NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_csbc_page_map] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vt_csbc_page_map]    Script Date: 8.06.2022 14:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vt_csbc_page_map]
AS
SELECT        CONVERT(nvarchar(10), dbo.csbc_page_map.id) as id, dbo.csbc_page.page_name AS mapped_page, dbo.csbc_theme.theme_name AS theme, dbo.csbc_position.pos_name AS position, dbo.csbc_user.user_code AS rec_user, FORMAT(dbo.csbc_page_map.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, 
                         dbo.csbc_page_map.rec_date AS rec_date1, dbo.csbc_page_map.rec_date AS rec_date2, dbo.csbc_page_map.id as page_map_id
FROM            dbo.csbc_page_map INNER JOIN
                         dbo.csbc_page ON dbo.csbc_page_map.mapped_page = dbo.csbc_page.id INNER JOIN
                         dbo.csbc_theme ON dbo.csbc_page_map.theme = dbo.csbc_theme.id INNER JOIN
                         dbo.csbc_position ON dbo.csbc_page_map.position = dbo.csbc_position.id INNER JOIN
                         dbo.csbc_user ON dbo.csbc_page_map.rec_user = dbo.csbc_user.id 
GO
/****** Object:  Table [dbo].[csbc_menu]    Script Date: 8.06.2022 14:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_menu](
	[id] [int] IDENTITY(8,1) NOT NULL,
	[menu_name] [nvarchar](150) NOT NULL,
	[adr_path] [int] NOT NULL,
	[menu_data] [nvarchar](max) NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_csbc_menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vt_csbc_theme]    Script Date: 8.06.2022 14:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vt_csbc_theme]
AS
SELECT        CONVERT(nvarchar(10), dbo.csbc_theme.id) as id, dbo.csbc_theme.theme_name, dbo.csbc_path.path_name AS adr_path, dbo.csbc_menu.menu_name AS theme_menu, dbo.csbc_user.user_code AS rec_user, FORMAT(dbo.csbc_theme.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, 
                         dbo.csbc_theme.rec_date AS rec_date1, dbo.csbc_theme.rec_date AS rec_date2, dbo.csbc_theme.id as theme_id
FROM            dbo.csbc_theme INNER JOIN
                         dbo.csbc_path ON dbo.csbc_theme.adr_path = dbo.csbc_path.id INNER JOIN
                         dbo.csbc_menu ON dbo.csbc_theme.theme_menu = dbo.csbc_menu.id INNER JOIN
                         dbo.csbc_user ON dbo.csbc_theme.rec_user = dbo.csbc_user.id 
GO
/****** Object:  Table [dbo].[csbc_group]    Script Date: 8.06.2022 14:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_group](
	[id] [int] IDENTITY(5,1) NOT NULL,
	[group_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_csbc_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[csbc_status]    Script Date: 8.06.2022 14:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_status](
	[id] [int] IDENTITY(3,1) NOT NULL,
	[status_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_csbc_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vt_csbc_user_s]    Script Date: 8.06.2022 14:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vt_csbc_user_s]
AS
SELECT        CONVERT(nvarchar(10), dbo.csbc_user.id) as id, dbo.csbc_user.user_name, dbo.csbc_user.user_code, dbo.csbc_user.user_psw, 
dbo.csbc_group.group_name AS user_group, dbo.csbc_user.e_mail, dbo.csbc_status.status_name AS rec_status, 
CONVERT(nvarchar(20), dbo.csbc_user.page_size) as page_size, 
                         csbc_user_1.user_code AS rec_user, FORMAT(dbo.csbc_user.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, 
						 dbo.csbc_user.rec_date AS rec_date1, dbo.csbc_user.rec_date AS rec_date2,
						 dbo.csbc_user.id as user_id
FROM            dbo.csbc_user INNER JOIN
                         dbo.csbc_status ON dbo.csbc_user.rec_status = dbo.csbc_status.id INNER JOIN
                         dbo.csbc_group ON dbo.csbc_user.user_group = dbo.csbc_group.id INNER JOIN
                         dbo.csbc_user AS csbc_user_1 ON dbo.csbc_user.id = csbc_user_1.rec_user
WHERE 			group_name <> 'Admin'
GO
/****** Object:  Table [dbo].[csbc_message]    Script Date: 8.06.2022 14:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_message](
	[id] [int] IDENTITY(3,1) NOT NULL,
	[msg_name] [nvarchar](150) NOT NULL,
	[msg_data] [nvarchar](max) NULL,
	[message_type] [int] NOT NULL,
	[rec_status] [int] NOT NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_csbc_message] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[csbc_message_map]    Script Date: 8.06.2022 14:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_message_map](
	[id] [int] IDENTITY(3,1) NOT NULL,
	[mapped_msg] [int] NOT NULL,
	[user_group] [int] NOT NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_csbc_message_map] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[csbc_message_type]    Script Date: 8.06.2022 14:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_message_type](
	[id] [int] IDENTITY(3,1) NOT NULL,
	[msg_type_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_csbc_message_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vt_csbc_view_message]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vt_csbc_view_message]
AS
SELECT        CONVERT(nvarchar(20), dbo.csbc_message.id) as id, dbo.csbc_message.msg_name, dbo.csbc_message.msg_data, 
dbo.csbc_message_type.msg_type_name AS message_type, dbo.csbc_status.status_name AS rec_status, 
CONVERT(nvarchar(10), dbo.csbc_message_map.user_group) as user_group, 
                         dbo.csbc_user.user_code AS rec_user, 
						 FORMAT(dbo.csbc_message.rec_date, 'dd.MM.yyyy HH:mm') AS rec_date, dbo.csbc_message.rec_date AS rec_date1, dbo.csbc_message.rec_date AS redc_date2,
						 dbo.csbc_message.id as message_id
FROM            dbo.csbc_message INNER JOIN
                         dbo.csbc_message_type ON dbo.csbc_message.message_type = dbo.csbc_message_type.id INNER JOIN
                         dbo.csbc_user ON dbo.csbc_message.rec_user = dbo.csbc_user.id INNER JOIN
                         dbo.csbc_status ON dbo.csbc_message.rec_status = dbo.csbc_status.id INNER JOIN
                         dbo.csbc_message_map ON dbo.csbc_message.id = dbo.csbc_message_map.mapped_msg 
GO
/****** Object:  View [dbo].[vt_csbc_user]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[vt_csbc_user]
AS
SELECT        CONVERT(nvarchar(10), dbo.csbc_user.id) as id, dbo.csbc_user.user_name, dbo.csbc_user.user_code, 
dbo.csbc_user.user_psw, dbo.csbc_group.group_name AS user_group, dbo.csbc_user.e_mail, dbo.csbc_status.status_name AS rec_status, 
CONVERT(nvarchar(10), dbo.csbc_user.page_size) as page_size, 
                         (select us.user_code from dbo.csbc_user as us where (dbo.csbc_user.rec_user = us.id)) AS rec_user, FORMAT(dbo.csbc_user.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, dbo.csbc_user.rec_date AS rec_date1, dbo.csbc_user.rec_date AS rec_date2,
						 dbo.csbc_user.id as user_id
FROM            dbo.csbc_user INNER JOIN
                         dbo.csbc_status ON dbo.csbc_user.rec_status = dbo.csbc_status.id INNER JOIN
                         dbo.csbc_group ON dbo.csbc_user.user_group = dbo.csbc_group.id 
GO
/****** Object:  View [dbo].[vt_csbc_message_type]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vt_csbc_message_type]
AS
SELECT  TOP (100) PERCENT CONVERT(nvarchar(10), dbo.csbc_message_type.id) as id, dbo.csbc_message_type.msg_type_name,
dbo.csbc_message_type.id as message_type_id
FROM dbo.csbc_message_type
ORDER BY message_type_id
GO
/****** Object:  Table [dbo].[csbc_page_type]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_page_type](
	[id] [int] IDENTITY(5,1) NOT NULL,
	[page_type_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_csbc_page_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vt_csbc_page_type]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vt_csbc_page_type]
AS
SELECT  TOP (100) PERCENT CONVERT(nvarchar(10), dbo.csbc_page_type.id) as id, dbo.csbc_page_type.page_type_name,
dbo.csbc_page_type.id as page_type_id
FROM dbo.csbc_page_type
ORDER BY dbo.csbc_page_type.id
GO
/****** Object:  View [dbo].[vt_csbc_path]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vt_csbc_path]
AS
SELECT  TOP (100) PERCENT CONVERT(nvarchar(10), dbo.csbc_path.id) as id, dbo.csbc_path.path_name,
dbo.csbc_path.id as path_id
FROM dbo.csbc_path
ORDER BY dbo.csbc_path.id
GO
/****** Object:  View [dbo].[vt_csbc_position]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vt_csbc_position]
AS
SELECT  TOP (100) PERCENT CONVERT(nvarchar(10), dbo.csbc_position.id) as id, dbo.csbc_position.pos_name,
dbo.csbc_position.id as position_id
FROM dbo.csbc_position
ORDER BY dbo.csbc_position.id
GO
/****** Object:  View [dbo].[vt_csbc_status]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vt_csbc_status]
AS
SELECT  TOP (100) PERCENT CONVERT(nvarchar(10), dbo.csbc_status.id) as id, dbo.csbc_status.status_name,
dbo.csbc_status.id as status_id
FROM dbo.csbc_status
ORDER BY dbo.csbc_status.id
GO
/****** Object:  View [dbo].[vt_csbc_page]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vt_csbc_page]
AS
SELECT        TOP (100) PERCENT CONVERT(nvarchar(10), dbo.csbc_page.id) as id, dbo.csbc_page.page_name, dbo.csbc_path.path_name AS adr_path, dbo.csbc_page_type.page_type_name AS page_type, dbo.csbc_status.status_name AS rec_status, dbo.csbc_user.user_code AS rec_user, 
                         FORMAT(dbo.csbc_page.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, dbo.csbc_page.rec_date AS rec_date1, dbo.csbc_page.rec_date AS rec_date2, dbo.csbc_page.id as page_id
FROM            dbo.csbc_page INNER JOIN
                         dbo.csbc_page_type ON dbo.csbc_page.page_type = dbo.csbc_page_type.id INNER JOIN
                         dbo.csbc_path ON dbo.csbc_page.adr_path = dbo.csbc_path.id INNER JOIN
                         dbo.csbc_status ON dbo.csbc_page.rec_status = dbo.csbc_status.id INNER JOIN
                         dbo.csbc_user ON dbo.csbc_page.rec_user = dbo.csbc_user.id 
order by page_id
GO
/****** Object:  Table [dbo].[csbc_code]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_code](
	[id] [int] IDENTITY(5,1) NOT NULL,
	[code_name] [nvarchar](150) NOT NULL,
	[adr_path] [int] NOT NULL,
	[code_data] [nvarchar](max) NULL,
	[code_type] [int] NOT NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_csbc_code] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[csbc_code_type]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_code_type](
	[id] [int] IDENTITY(3,1) NOT NULL,
	[code_type_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_csbc_code_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vt_csbc_code]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vt_csbc_code]
AS
SELECT       TOP (100) PERCENT CONVERT(nvarchar(10), dbo.csbc_code.id) AS id, dbo.csbc_code.code_name, dbo.csbc_path.path_name AS adr_path, dbo.csbc_code_type.code_type_name AS code_type, dbo.csbc_user.user_code AS rec_user, FORMAT(dbo.csbc_code.rec_date, 
                         'dd.MM.yyyy HH:mm') AS rec_date, dbo.csbc_code.rec_date AS rec_date1, dbo.csbc_code.rec_date AS rec_date2, dbo.csbc_code.id AS code_id
FROM            dbo.csbc_code INNER JOIN
                         dbo.csbc_path ON dbo.csbc_code.adr_path = dbo.csbc_path.id INNER JOIN
                         dbo.csbc_user ON dbo.csbc_code.rec_user = dbo.csbc_user.id INNER JOIN
                         dbo.csbc_code_type ON dbo.csbc_code.code_type = dbo.csbc_code_type.id
GO
/****** Object:  Table [dbo].[csbc_code_map]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_code_map](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mapped_code] [int] NOT NULL,
	[page_link] [int] NOT NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_csbc_code_map] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vt_csbc_code_map]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[vt_csbc_code_map]
AS
SELECT       TOP (100) PERCENT  CONVERT(nvarchar(10), dbo.csbc_code_map.id) as id, dbo.csbc_code.code_name AS mapped_code, dbo.csbc_page.page_name AS page_link, dbo.csbc_user.user_code AS rec_user, FORMAT(dbo.csbc_code_map.rec_date, 'dd.MM.yyyy HH:mm') AS rec_date, 
                         dbo.csbc_code_map.rec_date AS rec_date1, dbo.csbc_code_map.rec_date AS rec_date2,  dbo.csbc_code_map.id as code_map_id
FROM            dbo.csbc_code_map INNER JOIN
                         dbo.csbc_code ON dbo.csbc_code_map.mapped_code = dbo.csbc_code.id INNER JOIN
                         dbo.csbc_page ON dbo.csbc_code_map.page_link = dbo.csbc_page.id INNER JOIN
                         dbo.csbc_user ON dbo.csbc_code_map.rec_user = dbo.csbc_user.id
ORDER BY code_map_id
GO
/****** Object:  View [dbo].[vt_csbc_code_type]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[vt_csbc_code_type]
AS
SELECT  TOP (100) PERCENT CONVERT(nvarchar(10), dbo.csbc_code_type.id) as id, dbo.csbc_code_type.code_type_name, dbo.csbc_code_type.id as code_type_id 
FROM dbo.csbc_code_type
ORDER BY code_type_id
GO
/****** Object:  Table [dbo].[csbc_contact]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contact_name] [nvarchar](150) NOT NULL,
	[e_mail] [nvarchar](150) NULL,
	[web_site] [nvarchar](100) NOT NULL,
	[message_data] [nvarchar](1000) NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_csbc_contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vt_csbc_contact]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_csbc_contact]
AS
SELECT       TOP (100) PERCENT CONVERT(nvarchar(10), dbo.csbc_contact.id) AS id, dbo.csbc_contact.contact_name, dbo.csbc_contact.e_mail, dbo.csbc_contact.web_site, dbo.csbc_user.user_code AS rec_user, 
                         FORMAT(dbo.csbc_contact.rec_date, 'dd.MM.yyyy HH:mm') AS rec_date, dbo.csbc_contact.rec_date AS rec_date1, dbo.csbc_contact.rec_date AS rec_date2, dbo.csbc_contact.id AS contact_id, dbo.csbc_contact.message_data
FROM            dbo.csbc_contact INNER JOIN
                         dbo.csbc_user ON dbo.csbc_contact.rec_user = dbo.csbc_user.id
GO
/****** Object:  Table [dbo].[csbc_file]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_file](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[file_name] [nvarchar](150) NOT NULL,
	[adr_path] [int] NOT NULL,
	[file_data] [varbinary](max) NULL,
	[file_type] [int] NOT NULL,
	[file_size] [int] NOT NULL,
	[mime_type] [nvarchar](100) NOT NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_csbc_file] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[csbc_file_type]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_file_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[file_type_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_csbc_file_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vt_csbc_file]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[vt_csbc_file]
AS
SELECT        TOP (100) PERCENT CONVERT(nvarchar(10), dbo.csbc_file.id) as id, dbo.csbc_file.file_name, dbo.csbc_path.path_name AS adr_path, 
dbo.csbc_file_type.file_type_name as file_type, CONVERT(nvarchar(255), dbo.csbc_file.file_size) as file_size, dbo.csbc_file.mime_type, 
dbo.csbc_user.user_code AS rec_user, FORMAT(dbo.csbc_file.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, 
                         dbo.csbc_file.rec_date AS rec_date1, dbo.csbc_file.rec_date AS rec_date2,dbo.csbc_file.id as file_id
FROM            dbo.csbc_file INNER JOIN
                         dbo.csbc_path ON dbo.csbc_file.adr_path = dbo.csbc_path.id INNER JOIN
                         dbo.csbc_user ON dbo.csbc_file.rec_user = dbo.csbc_user.id INNER JOIN
                         dbo.csbc_file_type ON dbo.csbc_file.file_type = dbo.csbc_file_type.id
ORDER BY file_id
GO
/****** Object:  View [dbo].[vt_csbc_file_type]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[vt_csbc_file_type]
AS
SELECT  TOP (100) PERCENT CONVERT(nvarchar(10), dbo.csbc_file_type.id) as id, dbo.csbc_file_type.file_type_name,
dbo.csbc_file_type.id as file_type_id
FROM dbo.csbc_file_type
ORDER BY file_type_id
GO
/****** Object:  View [dbo].[vt_csbc_group]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vt_csbc_group]
AS
SELECT  TOP (100) PERCENT CONVERT(nvarchar(10), dbo.csbc_group.id) as id, dbo.csbc_group.group_name,
dbo.csbc_group.id as group_id
FROM dbo.csbc_group
ORDER BY group_id
GO
/****** Object:  View [dbo].[vt_csbc_group_s]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[vt_csbc_group_s]
AS
SELECT      TOP (100) PERCENT CONVERT(nvarchar(10), id) as id, group_name, id as group_id
FROM            dbo.csbc_group
WHERE        (group_name <> 'Admin')
ORDER BY group_id
GO
/****** Object:  Table [dbo].[csbc_image]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image_name] [nvarchar](150) NOT NULL,
	[adr_path] [int] NOT NULL,
	[image_data] [varbinary](max) NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_csbc_image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vt_csbc_image]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vt_csbc_image]
AS
SELECT        CONVERT(nvarchar(10), dbo.csbc_image.id) as id, dbo.csbc_image.image_name, dbo.csbc_path.path_name AS adr_path, dbo.csbc_user.user_code AS rec_user, FORMAT(dbo.csbc_image.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, dbo.csbc_image.rec_date AS rec_date1, 
                         dbo.csbc_image.rec_date AS rec_date2, dbo.csbc_image.id as image_id
FROM            dbo.csbc_image INNER JOIN
                         dbo.csbc_path ON dbo.csbc_image.adr_path = dbo.csbc_path.id INNER JOIN
                         dbo.csbc_user ON dbo.csbc_image.rec_user = dbo.csbc_user.id
GO
/****** Object:  Table [dbo].[csbc_log]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_log](
	[id] [int] IDENTITY(29,1) NOT NULL,
	[rec_id] [int] NOT NULL,
	[form_name] [int] NOT NULL,
	[type_name] [int] NOT NULL,
	[table_name] [int] NOT NULL,
	[log_data] [nvarchar](max) NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_csbc_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[csbc_log_form]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_log_form](
	[id] [int] IDENTITY(25,1) NOT NULL,
	[log_form_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_csbc_log_form] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[csbc_log_table]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_log_table](
	[id] [int] IDENTITY(14,1) NOT NULL,
	[log_table_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_csbc_log_table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[csbc_log_type]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csbc_log_type](
	[id] [int] IDENTITY(4,1) NOT NULL,
	[log_type_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_csbc_log_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vt_csbc_log]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vt_csbc_log]
AS
SELECT        CONVERT(nvarchar(20), dbo.csbc_log.id) as id, CONVERT(nvarchar(10), dbo.csbc_log.rec_id) as rec_id, dbo.csbc_log_form.log_form_name AS form_name, dbo.csbc_log_type.log_type_name AS type_name, dbo.csbc_log_table.log_table_name AS table_name, dbo.csbc_log.log_data, 
                         dbo.csbc_user.user_code AS rec_user, FORMAT(dbo.csbc_log.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, dbo.csbc_log.rec_date AS rec_date1, dbo.csbc_log.rec_date AS rec_date2, dbo.csbc_log.id as log_id
FROM            dbo.csbc_log INNER JOIN
                         dbo.csbc_log_form ON dbo.csbc_log.form_name = dbo.csbc_log_form.id INNER JOIN
                         dbo.csbc_log_table ON dbo.csbc_log.table_name = dbo.csbc_log_table.id INNER JOIN
                         dbo.csbc_log_type ON dbo.csbc_log.type_name = dbo.csbc_log_type.id INNER JOIN
                         dbo.csbc_user ON dbo.csbc_log.rec_user = dbo.csbc_user.id
GO
/****** Object:  View [dbo].[vt_csbc_log_form]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vt_csbc_log_form]
AS
SELECT  TOP (100) PERCENT CONVERT(nvarchar(10), dbo.csbc_log_form.id) as id, dbo.csbc_log_form.log_form_name,
dbo.csbc_log_form.id as log_form_id
FROM dbo.csbc_log_form
ORDER BY log_form_id
GO
/****** Object:  View [dbo].[vt_csbc_log_table]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vt_csbc_log_table]
AS
SELECT  TOP (100) PERCENT CONVERT(nvarchar(10), dbo.csbc_log_table.id) as id, dbo.csbc_log_table.log_table_name,
dbo.csbc_log_table.id as log_table_id
FROM dbo.csbc_log_table
ORDER BY log_table_id
GO
/****** Object:  View [dbo].[vt_csbc_log_type]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vt_csbc_log_type]
AS
SELECT  TOP (100) PERCENT CONVERT(nvarchar(10), dbo.csbc_log_type.id) as id, dbo.csbc_log_type.log_type_name,
dbo.csbc_log_type.id as log_type_id
FROM dbo.csbc_log_type
ORDER BY log_type_id
GO
/****** Object:  View [dbo].[vt_csbc_menu]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vt_csbc_menu]
AS
SELECT        CONVERT(nvarchar(10), dbo.csbc_menu.id) as id, dbo.csbc_menu.menu_name, dbo.csbc_path.path_name AS adr_path, dbo.csbc_menu.menu_data, dbo.csbc_user.user_code AS rec_user, FORMAT(dbo.csbc_menu.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, dbo.csbc_menu.rec_date AS rec_date1, 
                         dbo.csbc_menu.rec_date AS rec_date2, dbo.csbc_menu.id as menu_id
FROM            dbo.csbc_menu INNER JOIN
                         dbo.csbc_path ON dbo.csbc_menu.adr_path = dbo.csbc_path.id INNER JOIN
                         dbo.csbc_user ON dbo.csbc_menu.rec_user = dbo.csbc_user.id
GO
/****** Object:  View [dbo].[vt_csbc_message]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vt_csbc_message]
AS
SELECT        CONVERT(nvarchar(10), dbo.csbc_message.id) as id, dbo.csbc_message.msg_name, dbo.csbc_message.msg_data, dbo.csbc_message_type.msg_type_name AS message_type, dbo.csbc_status.status_name AS rec_status, dbo.csbc_user.user_code AS rec_user, 
                         FORMAT(dbo.csbc_message.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, dbo.csbc_message.rec_date AS rec_date1, dbo.csbc_message.rec_date AS redc_date2, dbo.csbc_message.id as message_id
FROM            dbo.csbc_message INNER JOIN
                         dbo.csbc_message_type ON dbo.csbc_message.message_type = dbo.csbc_message_type.id INNER JOIN
                         dbo.csbc_user ON dbo.csbc_message.rec_user = dbo.csbc_user.id INNER JOIN
                         dbo.csbc_status ON dbo.csbc_message.rec_status = dbo.csbc_status.id 
GO
/****** Object:  View [dbo].[vt_csbc_message_map]    Script Date: 8.06.2022 14:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vt_csbc_message_map]
AS
SELECT        CONVERT(nvarchar(10), dbo.csbc_message_map.id) as id, dbo.csbc_message.msg_name AS mapped_msg, dbo.csbc_group.group_name AS user_group, dbo.csbc_user.user_code AS rec_user, FORMAT(dbo.csbc_message_map.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, 
                         dbo.csbc_message_map.rec_date AS rec_date1, dbo.csbc_message_map.rec_date AS rec_date2, dbo.csbc_message_map.id as message_map_id
FROM            dbo.csbc_message_map INNER JOIN
                         dbo.csbc_message ON dbo.csbc_message_map.mapped_msg = dbo.csbc_message.id INNER JOIN
                         dbo.csbc_group ON dbo.csbc_message_map.user_group = dbo.csbc_group.id INNER JOIN
                         dbo.csbc_user ON dbo.csbc_message_map.rec_user = dbo.csbc_user.id 
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [code_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [code_unique] ON [dbo].[csbc_code]
(
	[code_name] ASC,
	[adr_path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [code_map_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [code_map_unique] ON [dbo].[csbc_code_map]
(
	[mapped_code] ASC,
	[page_link] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [code_type_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [code_type_unique] ON [dbo].[csbc_code_type]
(
	[code_type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [file_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [file_unique] ON [dbo].[csbc_file]
(
	[file_name] ASC,
	[adr_path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [file_type_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [file_type_unique] ON [dbo].[csbc_file_type]
(
	[file_type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [group_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [group_unique] ON [dbo].[csbc_group]
(
	[group_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [image_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [image_unique] ON [dbo].[csbc_image]
(
	[image_name] ASC,
	[adr_path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [log_form_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [log_form_unique] ON [dbo].[csbc_log_form]
(
	[log_form_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [log_table_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [log_table_unique] ON [dbo].[csbc_log_table]
(
	[log_table_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [log_type_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [log_type_unique] ON [dbo].[csbc_log_type]
(
	[log_type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [menu_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [menu_unique] ON [dbo].[csbc_menu]
(
	[menu_name] ASC,
	[adr_path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [message_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [message_unique] ON [dbo].[csbc_message]
(
	[msg_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [message_map_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [message_map_unique] ON [dbo].[csbc_message_map]
(
	[mapped_msg] ASC,
	[user_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [message_type_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [message_type_unique] ON [dbo].[csbc_message_type]
(
	[msg_type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [page_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [page_unique] ON [dbo].[csbc_page]
(
	[page_name] ASC,
	[adr_path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [page_link_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [page_link_unique] ON [dbo].[csbc_page_link]
(
	[link_name] ASC,
	[adr_path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [page_map_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [page_map_unique] ON [dbo].[csbc_page_map]
(
	[mapped_page] ASC,
	[theme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [page_type_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [page_type_unique] ON [dbo].[csbc_page_type]
(
	[page_type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [path_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [path_unique] ON [dbo].[csbc_path]
(
	[path_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [position_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [position_unique] ON [dbo].[csbc_position]
(
	[pos_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [status_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [status_unique] ON [dbo].[csbc_status]
(
	[status_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [theme_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [theme_unique] ON [dbo].[csbc_theme]
(
	[theme_name] ASC,
	[adr_path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [user_unique]    Script Date: 8.06.2022 14:08:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [user_unique] ON [dbo].[csbc_user]
(
	[user_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[csbc_code]  WITH CHECK ADD  CONSTRAINT [FK_csbc_code_csbc_code_type] FOREIGN KEY([code_type])
REFERENCES [dbo].[csbc_code_type] ([id])
GO
ALTER TABLE [dbo].[csbc_code] CHECK CONSTRAINT [FK_csbc_code_csbc_code_type]
GO
ALTER TABLE [dbo].[csbc_code]  WITH CHECK ADD  CONSTRAINT [FK_csbc_code_csbc_path] FOREIGN KEY([adr_path])
REFERENCES [dbo].[csbc_path] ([id])
GO
ALTER TABLE [dbo].[csbc_code] CHECK CONSTRAINT [FK_csbc_code_csbc_path]
GO
ALTER TABLE [dbo].[csbc_code]  WITH CHECK ADD  CONSTRAINT [FK_csbc_code_csbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[csbc_user] ([id])
GO
ALTER TABLE [dbo].[csbc_code] CHECK CONSTRAINT [FK_csbc_code_csbc_user]
GO
ALTER TABLE [dbo].[csbc_code_map]  WITH CHECK ADD  CONSTRAINT [FK_csbc_code_map_csbc_code] FOREIGN KEY([mapped_code])
REFERENCES [dbo].[csbc_code] ([id])
GO
ALTER TABLE [dbo].[csbc_code_map] CHECK CONSTRAINT [FK_csbc_code_map_csbc_code]
GO
ALTER TABLE [dbo].[csbc_code_map]  WITH CHECK ADD  CONSTRAINT [FK_csbc_code_map_csbc_page] FOREIGN KEY([page_link])
REFERENCES [dbo].[csbc_page] ([id])
GO
ALTER TABLE [dbo].[csbc_code_map] CHECK CONSTRAINT [FK_csbc_code_map_csbc_page]
GO
ALTER TABLE [dbo].[csbc_code_map]  WITH CHECK ADD  CONSTRAINT [FK_csbc_code_map_csbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[csbc_user] ([id])
GO
ALTER TABLE [dbo].[csbc_code_map] CHECK CONSTRAINT [FK_csbc_code_map_csbc_user]
GO
ALTER TABLE [dbo].[csbc_contact]  WITH CHECK ADD  CONSTRAINT [FK_csbc_contact_csbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[csbc_user] ([id])
GO
ALTER TABLE [dbo].[csbc_contact] CHECK CONSTRAINT [FK_csbc_contact_csbc_user]
GO
ALTER TABLE [dbo].[csbc_file]  WITH CHECK ADD  CONSTRAINT [FK_csbc_file_csbc_file_type] FOREIGN KEY([file_type])
REFERENCES [dbo].[csbc_file_type] ([id])
GO
ALTER TABLE [dbo].[csbc_file] CHECK CONSTRAINT [FK_csbc_file_csbc_file_type]
GO
ALTER TABLE [dbo].[csbc_file]  WITH CHECK ADD  CONSTRAINT [FK_csbc_file_csbc_path] FOREIGN KEY([adr_path])
REFERENCES [dbo].[csbc_path] ([id])
GO
ALTER TABLE [dbo].[csbc_file] CHECK CONSTRAINT [FK_csbc_file_csbc_path]
GO
ALTER TABLE [dbo].[csbc_file]  WITH CHECK ADD  CONSTRAINT [FK_csbc_file_csbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[csbc_user] ([id])
GO
ALTER TABLE [dbo].[csbc_file] CHECK CONSTRAINT [FK_csbc_file_csbc_user]
GO
ALTER TABLE [dbo].[csbc_image]  WITH CHECK ADD  CONSTRAINT [FK_csbc_image_csbc_path] FOREIGN KEY([adr_path])
REFERENCES [dbo].[csbc_path] ([id])
GO
ALTER TABLE [dbo].[csbc_image] CHECK CONSTRAINT [FK_csbc_image_csbc_path]
GO
ALTER TABLE [dbo].[csbc_image]  WITH CHECK ADD  CONSTRAINT [FK_csbc_image_csbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[csbc_user] ([id])
GO
ALTER TABLE [dbo].[csbc_image] CHECK CONSTRAINT [FK_csbc_image_csbc_user]
GO
ALTER TABLE [dbo].[csbc_log]  WITH CHECK ADD  CONSTRAINT [FK_csbc_log_csbc_log_form] FOREIGN KEY([form_name])
REFERENCES [dbo].[csbc_log_form] ([id])
GO
ALTER TABLE [dbo].[csbc_log] CHECK CONSTRAINT [FK_csbc_log_csbc_log_form]
GO
ALTER TABLE [dbo].[csbc_log]  WITH CHECK ADD  CONSTRAINT [FK_csbc_log_csbc_log_table] FOREIGN KEY([table_name])
REFERENCES [dbo].[csbc_log_table] ([id])
GO
ALTER TABLE [dbo].[csbc_log] CHECK CONSTRAINT [FK_csbc_log_csbc_log_table]
GO
ALTER TABLE [dbo].[csbc_log]  WITH CHECK ADD  CONSTRAINT [FK_csbc_log_csbc_log_type] FOREIGN KEY([type_name])
REFERENCES [dbo].[csbc_log_type] ([id])
GO
ALTER TABLE [dbo].[csbc_log] CHECK CONSTRAINT [FK_csbc_log_csbc_log_type]
GO
ALTER TABLE [dbo].[csbc_log]  WITH CHECK ADD  CONSTRAINT [FK_csbc_log_csbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[csbc_user] ([id])
GO
ALTER TABLE [dbo].[csbc_log] CHECK CONSTRAINT [FK_csbc_log_csbc_user]
GO
ALTER TABLE [dbo].[csbc_menu]  WITH CHECK ADD  CONSTRAINT [FK_csbc_menu_csbc_path] FOREIGN KEY([adr_path])
REFERENCES [dbo].[csbc_path] ([id])
GO
ALTER TABLE [dbo].[csbc_menu] CHECK CONSTRAINT [FK_csbc_menu_csbc_path]
GO
ALTER TABLE [dbo].[csbc_menu]  WITH CHECK ADD  CONSTRAINT [FK_csbc_menu_csbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[csbc_user] ([id])
GO
ALTER TABLE [dbo].[csbc_menu] CHECK CONSTRAINT [FK_csbc_menu_csbc_user]
GO
ALTER TABLE [dbo].[csbc_message]  WITH CHECK ADD  CONSTRAINT [FK_csbc_message_csbc_message_type] FOREIGN KEY([message_type])
REFERENCES [dbo].[csbc_message_type] ([id])
GO
ALTER TABLE [dbo].[csbc_message] CHECK CONSTRAINT [FK_csbc_message_csbc_message_type]
GO
ALTER TABLE [dbo].[csbc_message]  WITH CHECK ADD  CONSTRAINT [FK_csbc_message_csbc_status] FOREIGN KEY([rec_status])
REFERENCES [dbo].[csbc_status] ([id])
GO
ALTER TABLE [dbo].[csbc_message] CHECK CONSTRAINT [FK_csbc_message_csbc_status]
GO
ALTER TABLE [dbo].[csbc_message]  WITH CHECK ADD  CONSTRAINT [FK_csbc_message_csbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[csbc_user] ([id])
GO
ALTER TABLE [dbo].[csbc_message] CHECK CONSTRAINT [FK_csbc_message_csbc_user]
GO
ALTER TABLE [dbo].[csbc_message_map]  WITH CHECK ADD  CONSTRAINT [FK_csbc_message_map_csbc_group] FOREIGN KEY([user_group])
REFERENCES [dbo].[csbc_group] ([id])
GO
ALTER TABLE [dbo].[csbc_message_map] CHECK CONSTRAINT [FK_csbc_message_map_csbc_group]
GO
ALTER TABLE [dbo].[csbc_message_map]  WITH CHECK ADD  CONSTRAINT [FK_csbc_message_map_csbc_message] FOREIGN KEY([mapped_msg])
REFERENCES [dbo].[csbc_message] ([id])
GO
ALTER TABLE [dbo].[csbc_message_map] CHECK CONSTRAINT [FK_csbc_message_map_csbc_message]
GO
ALTER TABLE [dbo].[csbc_message_map]  WITH CHECK ADD  CONSTRAINT [FK_csbc_message_map_csbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[csbc_user] ([id])
GO
ALTER TABLE [dbo].[csbc_message_map] CHECK CONSTRAINT [FK_csbc_message_map_csbc_user]
GO
ALTER TABLE [dbo].[csbc_page]  WITH CHECK ADD  CONSTRAINT [FK_csbc_page_csbc_page_type] FOREIGN KEY([page_type])
REFERENCES [dbo].[csbc_page_type] ([id])
GO
ALTER TABLE [dbo].[csbc_page] CHECK CONSTRAINT [FK_csbc_page_csbc_page_type]
GO
ALTER TABLE [dbo].[csbc_page]  WITH CHECK ADD  CONSTRAINT [FK_csbc_page_csbc_path] FOREIGN KEY([adr_path])
REFERENCES [dbo].[csbc_path] ([id])
GO
ALTER TABLE [dbo].[csbc_page] CHECK CONSTRAINT [FK_csbc_page_csbc_path]
GO
ALTER TABLE [dbo].[csbc_page]  WITH CHECK ADD  CONSTRAINT [FK_csbc_page_csbc_status] FOREIGN KEY([rec_status])
REFERENCES [dbo].[csbc_status] ([id])
GO
ALTER TABLE [dbo].[csbc_page] CHECK CONSTRAINT [FK_csbc_page_csbc_status]
GO
ALTER TABLE [dbo].[csbc_page]  WITH CHECK ADD  CONSTRAINT [FK_csbc_page_csbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[csbc_user] ([id])
GO
ALTER TABLE [dbo].[csbc_page] CHECK CONSTRAINT [FK_csbc_page_csbc_user]
GO
ALTER TABLE [dbo].[csbc_page_link]  WITH CHECK ADD  CONSTRAINT [FK_csbc_page_link_csbc_page] FOREIGN KEY([linked_page])
REFERENCES [dbo].[csbc_page] ([id])
GO
ALTER TABLE [dbo].[csbc_page_link] CHECK CONSTRAINT [FK_csbc_page_link_csbc_page]
GO
ALTER TABLE [dbo].[csbc_page_link]  WITH CHECK ADD  CONSTRAINT [FK_csbc_page_link_csbc_path] FOREIGN KEY([adr_path])
REFERENCES [dbo].[csbc_path] ([id])
GO
ALTER TABLE [dbo].[csbc_page_link] CHECK CONSTRAINT [FK_csbc_page_link_csbc_path]
GO
ALTER TABLE [dbo].[csbc_page_link]  WITH CHECK ADD  CONSTRAINT [FK_csbc_page_link_csbc_position] FOREIGN KEY([position])
REFERENCES [dbo].[csbc_position] ([id])
GO
ALTER TABLE [dbo].[csbc_page_link] CHECK CONSTRAINT [FK_csbc_page_link_csbc_position]
GO
ALTER TABLE [dbo].[csbc_page_link]  WITH CHECK ADD  CONSTRAINT [FK_csbc_page_link_csbc_theme] FOREIGN KEY([theme])
REFERENCES [dbo].[csbc_theme] ([id])
GO
ALTER TABLE [dbo].[csbc_page_link] CHECK CONSTRAINT [FK_csbc_page_link_csbc_theme]
GO
ALTER TABLE [dbo].[csbc_page_link]  WITH CHECK ADD  CONSTRAINT [FK_csbc_page_link_csbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[csbc_user] ([id])
GO
ALTER TABLE [dbo].[csbc_page_link] CHECK CONSTRAINT [FK_csbc_page_link_csbc_user]
GO
ALTER TABLE [dbo].[csbc_page_map]  WITH CHECK ADD  CONSTRAINT [FK_csbc_page_map_csbc_page] FOREIGN KEY([mapped_page])
REFERENCES [dbo].[csbc_page] ([id])
GO
ALTER TABLE [dbo].[csbc_page_map] CHECK CONSTRAINT [FK_csbc_page_map_csbc_page]
GO
ALTER TABLE [dbo].[csbc_page_map]  WITH CHECK ADD  CONSTRAINT [FK_csbc_page_map_csbc_position] FOREIGN KEY([position])
REFERENCES [dbo].[csbc_position] ([id])
GO
ALTER TABLE [dbo].[csbc_page_map] CHECK CONSTRAINT [FK_csbc_page_map_csbc_position]
GO
ALTER TABLE [dbo].[csbc_page_map]  WITH CHECK ADD  CONSTRAINT [FK_csbc_page_map_csbc_theme] FOREIGN KEY([theme])
REFERENCES [dbo].[csbc_theme] ([id])
GO
ALTER TABLE [dbo].[csbc_page_map] CHECK CONSTRAINT [FK_csbc_page_map_csbc_theme]
GO
ALTER TABLE [dbo].[csbc_page_map]  WITH CHECK ADD  CONSTRAINT [FK_csbc_page_map_csbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[csbc_user] ([id])
GO
ALTER TABLE [dbo].[csbc_page_map] CHECK CONSTRAINT [FK_csbc_page_map_csbc_user]
GO
ALTER TABLE [dbo].[csbc_theme]  WITH CHECK ADD  CONSTRAINT [FK_csbc_theme_csbc_menu] FOREIGN KEY([theme_menu])
REFERENCES [dbo].[csbc_menu] ([id])
GO
ALTER TABLE [dbo].[csbc_theme] CHECK CONSTRAINT [FK_csbc_theme_csbc_menu]
GO
ALTER TABLE [dbo].[csbc_theme]  WITH CHECK ADD  CONSTRAINT [FK_csbc_theme_csbc_path] FOREIGN KEY([adr_path])
REFERENCES [dbo].[csbc_path] ([id])
GO
ALTER TABLE [dbo].[csbc_theme] CHECK CONSTRAINT [FK_csbc_theme_csbc_path]
GO
ALTER TABLE [dbo].[csbc_theme]  WITH CHECK ADD  CONSTRAINT [FK_csbc_theme_csbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[csbc_user] ([id])
GO
ALTER TABLE [dbo].[csbc_theme] CHECK CONSTRAINT [FK_csbc_theme_csbc_user]
GO
ALTER TABLE [dbo].[csbc_user]  WITH CHECK ADD  CONSTRAINT [FK_csbc_user_csbc_group] FOREIGN KEY([user_group])
REFERENCES [dbo].[csbc_group] ([id])
GO
ALTER TABLE [dbo].[csbc_user] CHECK CONSTRAINT [FK_csbc_user_csbc_group]
GO
ALTER TABLE [dbo].[csbc_user]  WITH CHECK ADD  CONSTRAINT [FK_csbc_user_csbc_status] FOREIGN KEY([rec_status])
REFERENCES [dbo].[csbc_status] ([id])
GO
ALTER TABLE [dbo].[csbc_user] CHECK CONSTRAINT [FK_csbc_user_csbc_status]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "csbc_code"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "csbc_path"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "csbc_user"
            Begin Extent = 
               Top = 102
               Left = 246
               Bottom = 232
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "csbc_code_type"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vt_csbc_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vt_csbc_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "csbc_contact"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "csbc_user"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vt_csbc_contact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vt_csbc_contact'
GO
USE [master]
GO
ALTER DATABASE [csbcdb] SET  READ_WRITE 
GO
