CREATE OR REPLACE FUNCTION make_reportgroup_titles_unique
RETURN varchar2 IS
    suf integer;
    newtitle varchar2(255);
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    for gr in (select title as title, count(*) as count from report_group group by title)
    loop
        IF (gr.title is null or gr.count <= 1) THEN
            CONTINUE;
        END IF;

        suf := 1;
        for dup in (select id, title from report_group where title = gr.title order by create_ts)
        loop
            IF (suf > 1) THEN
                newtitle := dup.title || ' ' || suf;
                update report_group set title = newtitle where id = dup.id;
            END IF;
            suf := suf + 1;
        end loop;
    end loop;
    COMMIT;
    return 'finished';
END make_reportgroup_titles_unique;
^
CREATE OR REPLACE FUNCTION make_report_names_unique
RETURN varchar2 IS
    suf integer;
    newname varchar2(255);
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    for r in (select name as name, count(*) as count from report_report group by name)
    loop
        IF (r.name is null or r.count <= 1) THEN
            CONTINUE;
        END IF;

        suf := 1;
        for dup in (select id, name from report_report where name = r.name order by create_ts)
        loop
            IF (suf > 1) THEN
                newname := dup.name || ' ' || suf;
                update report_report set name = newname where id = dup.id;
            END IF;
            suf := suf + 1;
        end loop;
    end loop;
    COMMIT;
    return 'finished';
END make_report_names_unique;
^

alter table REPORT_GROUP add SYS_TENANT_ID varchar2(255)^
alter table REPORT_REPORT add SYS_TENANT_ID varchar2(255)^

DECLARE
  COUNT_INDEXES INTEGER;
BEGIN
  SELECT COUNT(*) INTO COUNT_INDEXES
    FROM USER_INDEXES
    WHERE INDEX_NAME = 'IDX_REPORT_GROUP_UNIQ_TITLE';

  IF COUNT_INDEXES > 0 THEN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_REPORT_GROUP_UNIQ_TITLE';
  END IF;
END;
^
select make_reportgroup_titles_unique() from dual^
create unique index IDX_REPORT_GROUP_UNIQ_TITLE on REPORT_GROUP(TITLE, SYS_TENANT_ID, DELETE_TS)^

DECLARE
  COUNT_INDEXES INTEGER;
BEGIN
  SELECT COUNT(*) INTO COUNT_INDEXES
    FROM USER_INDEXES
    WHERE INDEX_NAME = 'IDX_REPORT_REPORT_UNIQ_NAME';

  IF COUNT_INDEXES > 0 THEN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_REPORT_REPORT_UNIQ_NAME';
  END IF;
END;
^
select make_report_names_unique() from dual^
create unique index IDX_REPORT_REPORT_UNIQ_NAME on REPORT_REPORT(NAME, SYS_TENANT_ID, DELETE_TS)^

drop function make_reportgroup_titles_unique^
drop function make_report_names_unique^