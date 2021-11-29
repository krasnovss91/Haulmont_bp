--$Id$

create table DF_DOC_KIND_REPORT_REPORT (
    CATEGORY_ID uuid,
    REPORT_ID uuid
)^

alter table DF_DOC_KIND_REPORT_REPORT add constraint FK_DOC_KIND_REPORT_DOC_KIND foreign key (CATEGORY_ID) references DF_DOC_KIND(CATEGORY_ID);
alter table DF_DOC_KIND_REPORT_REPORT add constraint FK_DOC_KIND_REPORT_REPORT foreign key (REPORT_ID) references REPORT_REPORT(ID);
