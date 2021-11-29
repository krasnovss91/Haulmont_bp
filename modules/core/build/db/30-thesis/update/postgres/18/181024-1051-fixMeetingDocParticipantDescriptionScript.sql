-- $Id$
update TS_MOBILE_CLIENT_CARD_METADATA
set properties = replace(properties, 'participantUser.employees','participantUser?.employees')
where entity_name = 'df$MeetingDoc'^