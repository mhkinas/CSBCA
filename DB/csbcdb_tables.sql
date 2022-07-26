USE [csbcdb]
GO
/****** Object:  Table [dbo].[csbc_code]    Script Date: 8.06.2022 14:09:06 ******/
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
/****** Object:  Table [dbo].[csbc_code_map]    Script Date: 8.06.2022 14:09:06 ******/
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
/****** Object:  Table [dbo].[csbc_code_type]    Script Date: 8.06.2022 14:09:06 ******/
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
/****** Object:  Table [dbo].[csbc_contact]    Script Date: 8.06.2022 14:09:06 ******/
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
/****** Object:  Table [dbo].[csbc_file]    Script Date: 8.06.2022 14:09:06 ******/
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
/****** Object:  Table [dbo].[csbc_file_type]    Script Date: 8.06.2022 14:09:06 ******/
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
/****** Object:  Table [dbo].[csbc_group]    Script Date: 8.06.2022 14:09:06 ******/
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
/****** Object:  Table [dbo].[csbc_image]    Script Date: 8.06.2022 14:09:07 ******/
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
/****** Object:  Table [dbo].[csbc_log]    Script Date: 8.06.2022 14:09:07 ******/
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
/****** Object:  Table [dbo].[csbc_log_form]    Script Date: 8.06.2022 14:09:07 ******/
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
/****** Object:  Table [dbo].[csbc_log_table]    Script Date: 8.06.2022 14:09:07 ******/
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
/****** Object:  Table [dbo].[csbc_log_type]    Script Date: 8.06.2022 14:09:07 ******/
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
/****** Object:  Table [dbo].[csbc_menu]    Script Date: 8.06.2022 14:09:07 ******/
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
/****** Object:  Table [dbo].[csbc_message]    Script Date: 8.06.2022 14:09:07 ******/
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
/****** Object:  Table [dbo].[csbc_message_map]    Script Date: 8.06.2022 14:09:07 ******/
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
/****** Object:  Table [dbo].[csbc_message_type]    Script Date: 8.06.2022 14:09:07 ******/
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
/****** Object:  Table [dbo].[csbc_page]    Script Date: 8.06.2022 14:09:07 ******/
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
/****** Object:  Table [dbo].[csbc_page_link]    Script Date: 8.06.2022 14:09:07 ******/
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
/****** Object:  Table [dbo].[csbc_page_map]    Script Date: 8.06.2022 14:09:07 ******/
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
/****** Object:  Table [dbo].[csbc_page_type]    Script Date: 8.06.2022 14:09:07 ******/
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
/****** Object:  Table [dbo].[csbc_path]    Script Date: 8.06.2022 14:09:07 ******/
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
/****** Object:  Table [dbo].[csbc_position]    Script Date: 8.06.2022 14:09:07 ******/
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
/****** Object:  Table [dbo].[csbc_status]    Script Date: 8.06.2022 14:09:07 ******/
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
/****** Object:  Table [dbo].[csbc_theme]    Script Date: 8.06.2022 14:09:07 ******/
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
/****** Object:  Table [dbo].[csbc_user]    Script Date: 8.06.2022 14:09:08 ******/
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
