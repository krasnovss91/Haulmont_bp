-- $Id$

update TS_MOBILE_CLIENT_CARD_METADATA
set properties = replace(cast(properties as varchar(max)), 'participantUser.employees','participantUser?.employees')
where entity_name = 'df$MeetingDoc'^