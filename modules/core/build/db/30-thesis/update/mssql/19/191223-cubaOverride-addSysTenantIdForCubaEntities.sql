CREATE PROCEDURE make_sec_group_names_unique
AS
BEGIN
	declare @r cursor;
	declare @dup cursor;
	declare @suf integer;
	declare @newname varchar(255);
	declare @name varchar(255);
	declare @dupId uniqueidentifier;

    create table #temp_sec_groups (name varchar(255), count integer);
    insert into #temp_sec_groups select name as name, count(*) as count from sec_group group by name;

	set @r = cursor scroll for
	    select name from #temp_sec_groups where name is not null and count > 1;

	open @r fetch next from @r into @name
	while @@fetch_status = 0
	begin
		set @suf = 1;
		set @dup = cursor scroll for
		    select id from sec_group where name = @name order by create_ts;

		open @dup fetch next from @dup into @dupId
		while @@fetch_status = 0
		begin
		    if (@suf > 1)
			begin
			    set @newname = @name + ' ' + cast(@suf as varchar(2));
			    update sec_group set name = @newname where id = @dupId;
			end;

			set @suf = @suf + 1;
		    fetch next from @dup into @dupId;
		end
		close @dup;

		fetch next from @r into @name;
	end
	close @r;

	drop table #temp_sec_groups;
END^

alter table SYS_FILE add SYS_TENANT_ID varchar(255)^
alter table SYS_SCHEDULED_TASK add SYS_TENANT_ID varchar(255)^
alter table SYS_SCHEDULED_EXECUTION add SYS_TENANT_ID varchar(255)^
alter table SEC_ROLE add SYS_TENANT_ID varchar(255)^
alter table SEC_GROUP add SYS_TENANT_ID varchar(255)^
alter table SEC_GROUP_HIERARCHY add SYS_TENANT_ID varchar(255)^
alter table SEC_USER add SYS_TENANT_ID varchar(255)^
alter table SEC_CONSTRAINT add SYS_TENANT_ID varchar(255)^
alter table SEC_SESSION_ATTR add SYS_TENANT_ID varchar(255)^
alter table SEC_USER_SUBSTITUTION add SYS_TENANT_ID varchar(255)^
alter table SEC_ENTITY_LOG add SYS_TENANT_ID varchar(255)^
alter table SEC_FILTER add SYS_TENANT_ID varchar(255)^
alter table SYS_FOLDER add SYS_TENANT_ID varchar(255)^
alter table SEC_PRESENTATION add SYS_TENANT_ID varchar(255)^
alter table SEC_SCREEN_HISTORY add SYS_TENANT_ID varchar(255)^
alter table SYS_SENDING_MESSAGE add SYS_TENANT_ID varchar(255)^
alter table SYS_SENDING_ATTACHMENT add SYS_TENANT_ID varchar(255)^
alter table SYS_ENTITY_SNAPSHOT add SYS_TENANT_ID varchar(255)^
alter table SEC_SESSION_LOG add SYS_TENANT_ID varchar(255)^

drop index IDX_SEC_USER_UNIQ_LOGIN on SEC_USER^
create unique index IDX_SEC_USER_UNIQ_LOGIN on SEC_USER (LOGIN_LC, SYS_TENANT_ID, DELETE_TS)^

drop index IDX_SEC_ROLE_UNIQ_NAME on SEC_ROLE^
create unique index IDX_SEC_ROLE_UNIQ_NAME on SEC_ROLE (NAME, SYS_TENANT_ID, DELETE_TS)^

if exists (select NAME from SYSINDEXES where NAME = 'IDX_SEC_GROUP_UNIQ_NAME') drop index SEC_GROUP.IDX_SEC_GROUP_UNIQ_NAME^
update SEC_GROUP set NAME = ID where NAME is null^
exec make_sec_group_names_unique^
create unique index IDX_SEC_GROUP_UNIQ_NAME on SEC_GROUP (NAME, SYS_TENANT_ID, DELETE_TS)^

drop procedure make_sec_group_names_unique^