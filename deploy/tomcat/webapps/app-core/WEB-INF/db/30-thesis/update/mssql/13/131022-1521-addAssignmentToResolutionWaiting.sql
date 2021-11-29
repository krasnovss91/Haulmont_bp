--$Id$
--Description:

alter table DF_RESOLUTION_WAITING_COMPLETE add ASSIGNMENT_ID uniqueidentifier;

alter table DF_RESOLUTION_WAITING_COMPLETE add constraint FK_DF_RESOLUTION_WAITING_ASSIGNMENT foreign key (ASSIGNMENT_ID) references WF_ASSIGNMENT(ID);