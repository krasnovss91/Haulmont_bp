-- $Id$
-- Description: delete user settings for card roles frame

delete from sec_user_setting  where value like '%cardRolesFrame.rolesTable%';