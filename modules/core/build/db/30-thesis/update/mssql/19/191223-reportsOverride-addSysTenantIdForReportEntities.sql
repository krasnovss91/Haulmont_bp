CREATE PROCEDURE make_report_group_titles_unique
AS
BEGIN
	declare @r cursor;
	declare @dup cursor;
	declare @suf integer;
	declare @newtitle varchar(255);
	declare @title varchar(255);
	declare @dupId uniqueidentifier;

    create table #temp_groups (title varchar(255), count integer);
    insert into #temp_groups select title as title, count(*) as count from report_group group by title;

	set @r = cursor scroll for
	    select title from #temp_groups where title is not null and count > 1;

	open @r fetch next from @r into @title
	while @@fetch_status = 0
	begin
		set @suf = 1;
		set @dup = cursor scroll for
		    select id from report_group where title = @title order by create_ts;

		open @dup fetch next from @dup into @dupId
		while @@fetch_status = 0
		begin
		    if (@suf > 1)
			begin
			    set @newtitle = @title + ' ' + cast(@suf as varchar(3));
			    update report_group set title = @newtitle where id = @dupId;
			end;

			set @suf = @suf + 1;
		    fetch next from @dup into @dupId;
		end
		close @dup;

		fetch next from @r into @title;
	end
	close @r;

	drop table #temp_groups;
END^

CREATE PROCEDURE make_report_names_unique
AS
BEGIN
	declare @r cursor;
	declare @dup cursor;
	declare @suf integer;
	declare @newname varchar(255);
	declare @name varchar(255);
	declare @dupId uniqueidentifier;

    create table #temp_reports (name varchar(255), count integer);
    insert into #temp_reports select name as name, count(*) as count from report_report group by name;

	set @r = cursor scroll for
	    select name from #temp_reports where name is not null and count > 1;

	open @r fetch next from @r into @name
	while @@fetch_status = 0
	begin
		set @suf = 1;
		set @dup = cursor scroll for
		    select id from report_report where name = @name order by create_ts;

		open @dup fetch next from @dup into @dupId
		while @@fetch_status = 0
		begin
		    if (@suf > 1)
			begin
			    set @newname = @name + ' ' + cast(@suf as varchar(3));
			    update report_report set name = @newname where id = @dupId;
			end;

			set @suf = @suf + 1;
		    fetch next from @dup into @dupId;
		end
		close @dup;

		fetch next from @r into @name;
	end
	close @r;

	drop table #temp_reports;
END^

alter table REPORT_GROUP add SYS_TENANT_ID varchar(255)^
alter table REPORT_REPORT add SYS_TENANT_ID varchar(255)^

if exists (select NAME from SYSINDEXES where NAME = 'IDX_REPORT_GROUP_UNIQ_TITLE') drop index REPORT_GROUP.IDX_REPORT_GROUP_UNIQ_TITLE^
exec make_report_group_titles_unique^
create unique index IDX_REPORT_GROUP_UNIQ_TITLE on REPORT_GROUP(TITLE, SYS_TENANT_ID, DELETE_TS)^

if exists (select NAME from SYSINDEXES where NAME = 'IDX_REPORT_REPORT_UNIQ_NAME') drop index REPORT_REPORT.IDX_REPORT_REPORT_UNIQ_NAME^
exec make_report_names_unique^
create unique index IDX_REPORT_REPORT_UNIQ_NAME on REPORT_REPORT(NAME, SYS_TENANT_ID, DELETE_TS)^

drop procedure make_report_group_titles_unique^
drop procedure make_report_names_unique^