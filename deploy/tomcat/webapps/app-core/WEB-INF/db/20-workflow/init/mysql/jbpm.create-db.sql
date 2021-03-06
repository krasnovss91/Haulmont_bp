
create table JBPM4_DEPLOYMENT (
    DBID_ bigint not null,
    NAME_ text,
    TIMESTAMP_ bigint,
    STATE_ varchar(255),
    primary key (DBID_)
)^

create table JBPM4_DEPLOYPROP (
    DBID_ bigint not null,
    DEPLOYMENT_ bigint,
    OBJNAME_ varchar(255),
    KEY_ varchar(255),
    STRINGVAL_ varchar(255),
    LONGVAL_ bigint,
    primary key (DBID_)
)^

create table JBPM4_EXECUTION (
    DBID_ bigint not null,
    CLASS_ varchar(255) not null,
    DBVERSION_ int not null,
    ACTIVITYNAME_ varchar(255),
    PROCDEFID_ varchar(255),
    HASVARS_ tinyint,
    NAME_ varchar(255),
    KEY_ varchar(255),
    ID_ varchar(190) unique,
    STATE_ varchar(255),
    SUSPHISTSTATE_ varchar(255),
    PRIORITY_ int,
    HISACTINST_ bigint,
    PARENT_ bigint,
    INSTANCE_ bigint,
    SUPEREXEC_ bigint,
    SUBPROCINST_ bigint,
    PARENT_IDX_ int,
    primary key (DBID_)
)^

create table JBPM4_HIST_ACTINST (
    DBID_ bigint not null,
    CLASS_ varchar(255) not null,
    DBVERSION_ int not null,
    HPROCI_ bigint,
    TYPE_ varchar(255),
    EXECUTION_ varchar(255),
    ACTIVITY_NAME_ varchar(255),
    START_ datetime,
    END_ datetime,
    DURATION_ bigint,
    TRANSITION_ varchar(255),
    NEXTIDX_ int,
    HTASK_ bigint,
    primary key (DBID_)
)^

create table JBPM4_HIST_DETAIL (
    DBID_ bigint not null,
    CLASS_ varchar(255) not null,
    DBVERSION_ int not null,
    USERID_ varchar(255),
    TIME_ datetime,
    HPROCI_ bigint,
    HPROCIIDX_ int,
    HACTI_ bigint,
    HACTIIDX_ int,
    HTASK_ bigint,
    HTASKIDX_ int,
    HVAR_ bigint,
    HVARIDX_ int,
    MESSAGE_ text,
    OLD_STR_ varchar(255),
    NEW_STR_ varchar(255),
    OLD_INT_ int,
    NEW_INT_ int,
    OLD_TIME_ datetime,
    NEW_TIME_ datetime,
    PARENT_ bigint,
    PARENT_IDX_ int,
    primary key (DBID_)
)^

create table JBPM4_HIST_PROCINST (
    DBID_ bigint not null,
    DBVERSION_ int not null,
    ID_ varchar(255),
    PROCDEFID_ varchar(255),
    KEY_ varchar(255),
    START_ datetime,
    END_ datetime,
    DURATION_ bigint,
    STATE_ varchar(255),
    ENDACTIVITY_ varchar(255),
    NEXTIDX_ int,
    primary key (DBID_)
)^

create table JBPM4_HIST_TASK (
    DBID_ bigint not null,
    DBVERSION_ int not null,
    EXECUTION_ varchar(255),
    OUTCOME_ varchar(255),
    ASSIGNEE_ varchar(255),
    PRIORITY_ int,
    STATE_ varchar(255),
    CREATE_ datetime,
    END_ datetime,
    DURATION_ bigint,
    NEXTIDX_ int,
    SUPERTASK_ bigint,
    primary key (DBID_)
)^

create table JBPM4_HIST_VAR (
    DBID_ bigint not null,
    DBVERSION_ int not null,
    PROCINSTID_ varchar(255),
    EXECUTIONID_ varchar(255),
    VARNAME_ varchar(255),
    VALUE_ varchar(255),
    HPROCI_ bigint,
    HTASK_ bigint,
    primary key (DBID_)
)^

create table JBPM4_ID_GROUP (
    DBID_ bigint not null,
    DBVERSION_ int not null,
    ID_ varchar(255),
    NAME_ varchar(255),
    TYPE_ varchar(255),
    PARENT_ bigint,
    primary key (DBID_)
)^

create table JBPM4_ID_MEMBERSHIP (
    DBID_ bigint not null,
    DBVERSION_ int not null,
    USER_ bigint,
    GROUP_ bigint,
    NAME_ varchar(255),
    primary key (DBID_)
)^

create table JBPM4_ID_USER (
    DBID_ bigint not null,
    DBVERSION_ int not null,
    ID_ varchar(255),
    PASSWORD_ varchar(255),
    GIVENNAME_ varchar(255),
    FAMILYNAME_ varchar(255),
    BUSINESSEMAIL_ varchar(255),
    primary key (DBID_)
)^

create table JBPM4_JOB (
    DBID_ bigint not null,
    CLASS_ varchar(255) not null,
    DBVERSION_ int not null,
    DUEDATE_ datetime,
    STATE_ varchar(255),
    ISEXCLUSIVE_ tinyint,
    LOCKOWNER_ varchar(255),
    LOCKEXPTIME_ datetime,
    EXCEPTION_ text,
    RETRIES_ int,
    PROCESSINSTANCE_ bigint,
    EXECUTION_ bigint,
    CFG_ bigint,
    SIGNAL_ varchar(255),
    EVENT_ varchar(255),
    REPEAT_ varchar(255),
    primary key (DBID_)
)^

create table JBPM4_LOB (
    DBID_ bigint not null,
    DBVERSION_ int not null,
    BLOB_VALUE_ blob,
    DEPLOYMENT_ bigint,
    NAME_ text,
    primary key (DBID_)
)^

create table JBPM4_PARTICIPATION (
    DBID_ bigint not null,
    DBVERSION_ int not null,
    GROUPID_ varchar(255),
    USERID_ varchar(255),
    TYPE_ varchar(255),
    TASK_ bigint,
    SWIMLANE_ bigint,
    primary key (DBID_)
)^

create table JBPM4_PROPERTY (
    KEY_ varchar(190) not null,
    VERSION_ int not null,
    VALUE_ varchar(255),
    primary key (KEY_)
)^

create table JBPM4_SWIMLANE (
    DBID_ bigint not null,
    DBVERSION_ int not null,
    NAME_ varchar(255),
    ASSIGNEE_ varchar(255),
    EXECUTION_ bigint,
    primary key (DBID_)
)^

create table JBPM4_TASK (
    DBID_ bigint not null,
    CLASS_ char(1) not null,
    DBVERSION_ int not null,
    NAME_ varchar(255),
    DESCR_ text,
    STATE_ varchar(255),
    SUSPHISTSTATE_ varchar(255),
    ASSIGNEE_ varchar(255),
    FORM_ varchar(255),
    PRIORITY_ int,
    CREATE_ datetime,
    DUEDATE_ datetime,
    PROGRESS_ int,
    SIGNALLING_ tinyint,
    EXECUTION_ID_ varchar(255),
    ACTIVITY_NAME_ varchar(255),
    HASVARS_ tinyint,
    SUPERTASK_ bigint,
    EXECUTION_ bigint,
    PROCINST_ bigint,
    SWIMLANE_ bigint,
    TASKDEFNAME_ varchar(255),
    primary key (DBID_)
)^

create table JBPM4_VARIABLE (
    DBID_ bigint not null,
    CLASS_ varchar(190) not null,
    DBVERSION_ int not null,
    KEY_ varchar(255),
    CONVERTER_ varchar(255),
    HIST_ tinyint,
    EXECUTION_ bigint,
    TASK_ bigint,
    LOB_ bigint,
    DATE_VALUE_ datetime,
    DOUBLE_VALUE_ float,
    CLASSNAME_ varchar(255),
    LONG_VALUE_ bigint,
    STRING_VALUE_ text,
    TEXT_VALUE_ text,
    EXESYS_ bigint,
    primary key (DBID_)
)^

create index IDX_DEPLPROP_DEPL on JBPM4_DEPLOYPROP (DEPLOYMENT_)^

alter table JBPM4_DEPLOYPROP
    add constraint FK_DEPLPROP_DEPL
    foreign key (DEPLOYMENT_)
    references JBPM4_DEPLOYMENT(DBID_)^

create index IDX_EXEC_SUPEREXEC on JBPM4_EXECUTION (SUPEREXEC_)^

create index IDX_EXEC_INSTANCE on JBPM4_EXECUTION (INSTANCE_)^

create index IDX_EXEC_SUBPI on JBPM4_EXECUTION (SUBPROCINST_)^

create index IDX_EXEC_PARENT on JBPM4_EXECUTION (PARENT_)^

alter table JBPM4_EXECUTION
    add constraint FK_EXEC_PARENT
    foreign key (PARENT_)
    references JBPM4_EXECUTION(DBID_)^

alter table JBPM4_EXECUTION
    add constraint FK_EXEC_SUBPI
    foreign key (SUBPROCINST_)
    references JBPM4_EXECUTION(DBID_)^

alter table JBPM4_EXECUTION
    add constraint FK_EXEC_INSTANCE
    foreign key (INSTANCE_)
    references JBPM4_EXECUTION(DBID_)^

alter table JBPM4_EXECUTION
    add constraint FK_EXEC_SUPEREXEC
    foreign key (SUPEREXEC_)
    references JBPM4_EXECUTION(DBID_)^

create index IDX_HACTI_HPROCI on JBPM4_HIST_ACTINST (HPROCI_)^

create index IDX_HTI_HTASK on JBPM4_HIST_ACTINST (HTASK_)^

alter table JBPM4_HIST_ACTINST
    add constraint FK_HACTI_HPROCI
    foreign key (HPROCI_)
    references JBPM4_HIST_PROCINST(DBID_)^

alter table JBPM4_HIST_ACTINST
    add constraint FK_HTI_HTASK
    foreign key (HTASK_)
    references JBPM4_HIST_TASK(DBID_)^

create index IDX_HDET_HACTI on JBPM4_HIST_DETAIL (HACTI_)^

create index IDX_HDET_HPROCI on JBPM4_HIST_DETAIL (HPROCI_)^

create index IDX_HDET_HVAR on JBPM4_HIST_DETAIL (HVAR_)^

create index IDX_HDET_HTASK on JBPM4_HIST_DETAIL (HTASK_)^

alter table JBPM4_HIST_DETAIL
    add constraint FK_HDETAIL_HPROCI
    foreign key (HPROCI_)
    references JBPM4_HIST_PROCINST(DBID_)^

alter table JBPM4_HIST_DETAIL
    add constraint FK_HDETAIL_HACTI
    foreign key (HACTI_)
    references JBPM4_HIST_ACTINST(DBID_)^

alter table JBPM4_HIST_DETAIL
    add constraint FK_HDETAIL_HTASK
    foreign key (HTASK_)
    references JBPM4_HIST_TASK(DBID_)^

alter table JBPM4_HIST_DETAIL
    add constraint FK_HDETAIL_HVAR
    foreign key (HVAR_)
    references JBPM4_HIST_VAR(DBID_)^

create index IDX_HSUPERT_SUB on JBPM4_HIST_TASK (SUPERTASK_)^

alter table JBPM4_HIST_TASK
    add constraint FK_HSUPERT_SUB
    foreign key (SUPERTASK_)
    references JBPM4_HIST_TASK(DBID_)^

create index IDX_HVAR_HPROCI on JBPM4_HIST_VAR (HPROCI_)^

create index IDX_HVAR_HTASK on JBPM4_HIST_VAR (HTASK_)^

alter table JBPM4_HIST_VAR
    add constraint FK_HVAR_HPROCI
    foreign key (HPROCI_)
    references JBPM4_HIST_PROCINST(DBID_)^

alter table JBPM4_HIST_VAR
    add constraint FK_HVAR_HTASK
    foreign key (HTASK_)
    references JBPM4_HIST_TASK(DBID_)^

create index IDX_GROUP_PARENT on JBPM4_ID_GROUP (PARENT_)^

alter table JBPM4_ID_GROUP
    add constraint FK_GROUP_PARENT
    foreign key (PARENT_)
    references JBPM4_ID_GROUP(DBID_)^

create index IDX_MEM_USER on JBPM4_ID_MEMBERSHIP (USER_)^

create index IDX_MEM_GROUP on JBPM4_ID_MEMBERSHIP (GROUP_)^

alter table JBPM4_ID_MEMBERSHIP
    add constraint FK_MEM_GROUP
    foreign key (GROUP_)
    references JBPM4_ID_GROUP(DBID_)^

alter table JBPM4_ID_MEMBERSHIP
    add constraint FK_MEM_USER
    foreign key (USER_)
    references JBPM4_ID_USER(DBID_)^

create index IDX_JOBRETRIES on JBPM4_JOB (RETRIES_)^

create index IDX_JOB_CFG on JBPM4_JOB (CFG_)^

create index IDX_JOB_PRINST on JBPM4_JOB (PROCESSINSTANCE_)^

create index IDX_JOB_EXE on JBPM4_JOB (EXECUTION_)^

create index IDX_JOBLOCKEXP on JBPM4_JOB (LOCKEXPTIME_)^

create index IDX_JOBDUEDATE on JBPM4_JOB (DUEDATE_)^

alter table JBPM4_JOB
    add constraint FK_JOB_CFG
    foreign key (CFG_)
    references JBPM4_LOB(DBID_)^

create index IDX_LOB_DEPLOYMENT on JBPM4_LOB (DEPLOYMENT_)^

alter table JBPM4_LOB
    add constraint FK_LOB_DEPLOYMENT
    foreign key (DEPLOYMENT_)
    references JBPM4_DEPLOYMENT(DBID_)^

create index IDX_PART_TASK on JBPM4_PARTICIPATION (TASK_)^

alter table JBPM4_PARTICIPATION
    add constraint FK_PART_SWIMLANE
    foreign key (SWIMLANE_)
    references JBPM4_SWIMLANE(DBID_)^

alter table JBPM4_PARTICIPATION
    add constraint FK_PART_TASK
    foreign key (TASK_)
    references JBPM4_TASK(DBID_)^

create index IDX_SWIMLANE_EXEC on JBPM4_SWIMLANE (EXECUTION_)^

alter table JBPM4_SWIMLANE
    add constraint FK_SWIMLANE_EXEC
    foreign key (EXECUTION_)
    references JBPM4_EXECUTION(DBID_)^

create index IDX_TASK_SUPERTASK on JBPM4_TASK (SUPERTASK_)^

alter table JBPM4_TASK
    add constraint FK_TASK_SWIML
    foreign key (SWIMLANE_)
    references JBPM4_SWIMLANE(DBID_)^

alter table JBPM4_TASK
    add constraint FK_TASK_SUPERTASK
    foreign key (SUPERTASK_)
    references JBPM4_TASK(DBID_)^

create index IDX_VAR_EXESYS on JBPM4_VARIABLE (EXESYS_)^

create index IDX_VAR_TASK on JBPM4_VARIABLE (TASK_)^

create index IDX_VAR_EXECUTION on JBPM4_VARIABLE (EXECUTION_)^

create index IDX_VAR_LOB on JBPM4_VARIABLE (LOB_)^

alter table JBPM4_VARIABLE
    add constraint FK_VAR_LOB
    foreign key (LOB_)
    references JBPM4_LOB(DBID_)^

alter table JBPM4_VARIABLE
    add constraint FK_VAR_EXECUTION
    foreign key (EXECUTION_)
    references JBPM4_EXECUTION(DBID_)^

alter table JBPM4_VARIABLE
    add constraint FK_VAR_EXESYS
    foreign key (EXESYS_)
    references JBPM4_EXECUTION(DBID_)^

alter table JBPM4_VARIABLE
    add constraint FK_VAR_TASK
    foreign key (TASK_)
    references JBPM4_TASK(DBID_)^
