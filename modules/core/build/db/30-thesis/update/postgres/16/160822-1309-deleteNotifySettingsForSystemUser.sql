-- $Id$
-- Description:

delete from SEC_USER_SETTING where name in ('notifyOverdueCardsByScheduler', 'notifyUserOnceADay')
 and USER_ID = (select u.ID from SEC_USER u where login = 'system')