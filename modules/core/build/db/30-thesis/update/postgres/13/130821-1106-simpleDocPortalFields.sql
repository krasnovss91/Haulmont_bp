-- $Id$

alter table DF_SIMPLE_DOC add PORTAL_AUTHOR_NAME varchar(500),
                                  add PORTAL_AUTHOR_EMAIL varchar(500),
                                  add PORTAL_PUBLISH_STATE varchar(5),
                                  add FROM_PORTAL boolean;
