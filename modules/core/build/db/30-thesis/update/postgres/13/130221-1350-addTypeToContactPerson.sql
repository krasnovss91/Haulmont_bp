--$Id$
--$Description:

alter table DF_CONTACT_PERSON add column TYPE varchar(1);
update DF_CONTACT_PERSON set TYPE = 'T';