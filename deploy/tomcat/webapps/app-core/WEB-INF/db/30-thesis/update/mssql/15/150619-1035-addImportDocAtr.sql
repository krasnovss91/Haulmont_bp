-- $Id$
-- Description:
insert INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type) values
(newId(), current_timestamp, 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Тема', 'theme', 'String');
insert INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type) values
(newId(), current_timestamp, 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Основание для приказа', 'orderCause', 'String');
insert INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type) values
(newId(), current_timestamp, 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Текст приказа', 'orderText', 'String');