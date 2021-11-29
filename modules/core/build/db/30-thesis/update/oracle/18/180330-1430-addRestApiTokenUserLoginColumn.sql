-- $Id$

alter table TS_REST_API_TOKEN add USER_LOGIN varchar2(50 char)^

update TS_REST_API_TOKEN set USER_LOGIN = CREATED_BY^