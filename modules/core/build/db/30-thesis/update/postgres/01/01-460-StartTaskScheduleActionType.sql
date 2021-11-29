-- $Id$
-- Description: insert data for schedule action type 'Task start'


insert into TM_SCHEDULE_ACTION_TYPE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,screen_id,entity_name,processor_class_name) values (newid(),now(),USER,7,now(),USER,null,null,'Запуск задачи','tm$StartTaskScheduleAction.edit','tm$StartTaskScheduleAction','com.haulmont.thesis.core.schedule.ext.StartTaskScheduleActionProcessor');