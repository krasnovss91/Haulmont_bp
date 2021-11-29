--$Id$

alter table df_numerator add number_initial_value integer ;
update df_numerator set number_initial_value = 1^