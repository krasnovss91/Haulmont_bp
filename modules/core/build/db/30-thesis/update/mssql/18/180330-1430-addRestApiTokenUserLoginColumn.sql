-- $Id$

alter table TS_REST_API_TOKEN add USER_LOGIN varchar(50)^
update TS_REST_API_TOKEN set USER_LOGIN = CREATED_BY;