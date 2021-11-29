--$Id$
--Description: add DF_RESOLUTION_CARD table for using in resolution process

create table DF_RESOLUTION_CARD (
      ID uniqueidentifier not null,
      CREATE_TS datetime,
      CREATED_BY varchar(50),
      CARD_ID uniqueidentifier not null,
      CARD_TO_RESOLUTION_ID uniqueidentifier not null,
      primary key (ID)
);

alter table DF_RESOLUTION_CARD add constraint FK_DF_RESOLUTION_CARD_CARD foreign key (CARD_ID) references WF_CARD(ID);
alter table DF_RESOLUTION_CARD add constraint FK_DF_RESOLUTION_CARD_CARD_TO_RESOLUTION foreign key (CARD_TO_RESOLUTION_ID) references WF_CARD(ID);