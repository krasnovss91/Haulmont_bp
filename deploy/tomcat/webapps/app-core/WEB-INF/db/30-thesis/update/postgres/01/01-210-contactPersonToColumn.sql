-- $Id$
-- Description: add contact person to column in doc for office

alter table DF_DOC add OFFICE_CONTACT_PERSON_TO_ID uuid;

alter table DF_DOC add constraint FK_DF_DOC_OFFICE_CONTACT_PERSON_TO foreign key (OFFICE_CONTACT_PERSON_TO_ID) references DF_CONTACT_PERSON (ID);