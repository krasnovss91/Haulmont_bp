drop index sec_screen_history.idx_sec_screen_history_create_ts^
alter table sec_screen_history alter column create_ts datetime2(3)^
create clustered index IDX_SEC_SCREEN_HISTORY_CREATE_TS on SEC_SCREEN_HISTORY (CREATE_TS)^