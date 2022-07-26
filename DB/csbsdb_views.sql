USE [csbcdb]
GO
/****** Object:  View [dbo].[vt_csbc_code]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_code_map]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_code_type]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_contact]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_file]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_file_type]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_group]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_group_s]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_image]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_log]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_log_form]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_log_table]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_log_type]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_menu]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_message]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_message_map]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_message_type]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_page]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_page_link]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_page_map]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_page_type]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_path]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_position]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_status]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_theme]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_user]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_user_s]    Script Date: 8.06.2022 14:09:53 ******/
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
/****** Object:  View [dbo].[vt_csbc_view_message]    Script Date: 8.06.2022 14:09:53 ******/
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
