--$Id$

insert into sys_config select newid(), getdate(), 'system', 1, null, null, 'cuba.fts.maxSearchResults', '10000'
where not exists (select 1 from sys_config where name = 'cuba.fts.maxSearchResults')