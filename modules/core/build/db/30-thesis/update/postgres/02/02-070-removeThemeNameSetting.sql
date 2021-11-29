-- $Id$
-- Description: remove all theme name settings

delete from sec_user_setting where name = 'appWindowTheme';