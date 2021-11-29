--$Id$

alter table DF_DOC_KIND add organization_id uniqueidentifier^

alter table DF_DOC_KIND add constraint fk_DOC_KIND_organization foreign key (organization_id) references DF_ORGANIZATION (id)^