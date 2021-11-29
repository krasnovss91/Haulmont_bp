CREATE OR REPLACE FUNCTION make_report_group_titles_unique()
  RETURNS void AS
$BODY$
DECLARE
    r record;
    dup record;
    suf integer;
    newtitle varchar;
BEGIN
    create temp table temp_groups on commit drop as
      select title as title, count(*) as count from report_group group by title;

    for r in select * from temp_groups where count > 1
    loop
      create temp table temp_dups on commit drop as
        select id, create_ts, title from report_group where title = r.title;

      suf = 1;
      for dup in select * from temp_dups order by create_ts
      loop
        if (suf > 1) then
            newtitle = dup.title || ' ' || suf;
            update report_group set title = newtitle where id = dup.id;
        end if;
        suf = suf + 1;
      end loop;

      drop table temp_dups;
    end loop;
    return;
END;
$BODY$
LANGUAGE plpgsql^

CREATE OR REPLACE FUNCTION make_report_names_unique()
  RETURNS void AS
$BODY$
DECLARE
    r record;
    dup record;
    suf integer;
    newname varchar;
BEGIN
    create temp table temp_reports on commit drop as
      select name as name, count(*) as count from report_report group by name;

    for r in select * from temp_reports where count > 1
    loop
      create temp table temp_dups on commit drop as
        select id, create_ts, name from report_report where name = r.name;

      suf = 1;
      for dup in select * from temp_dups order by create_ts
      loop
        if (suf > 1) then
            newname = dup.name || ' ' || suf;
            update report_report set name = newname where id = dup.id;
        end if;
        suf = suf + 1;
      end loop;

      drop table temp_dups;
    end loop;
    return;
END;
$BODY$
LANGUAGE plpgsql^

alter table REPORT_GROUP add SYS_TENANT_ID varchar(255)^
alter table REPORT_REPORT add SYS_TENANT_ID varchar(255)^

drop index if exists IDX_REPORT_GROUP_UNIQ_TITLE^
select make_report_group_titles_unique()^
create unique index IDX_REPORT_GROUP_UNIQ_TITLE on REPORT_GROUP (TITLE) where DELETE_TS is null and SYS_TENANT_ID is null^
create unique index IDX_REPORT_GROUP_UNIQ_TITLE_SYS_TENANT_ID_NN on REPORT_GROUP (TITLE, SYS_TENANT_ID)
    where DELETE_TS is null and SYS_TENANT_ID is not null^

drop index if exists IDX_REPORT_REPORT_UNIQ_NAME^
select make_report_names_unique()^
create unique index IDX_REPORT_REPORT_UNIQ_NAME on REPORT_REPORT (NAME) where DELETE_TS is null and SYS_TENANT_ID is null^
create unique index IDX_REPORT_REPORT_UNIQ_NAME_SYS_TENANT_ID_NN on REPORT_REPORT (NAME, SYS_TENANT_ID)
    where DELETE_TS is null and SYS_TENANT_ID is not null^

drop function make_report_group_titles_unique()^
drop function make_report_names_unique()^