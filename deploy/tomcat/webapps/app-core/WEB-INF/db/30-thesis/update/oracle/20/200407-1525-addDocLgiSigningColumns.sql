alter table DF_DOC add LGI_SIGN_REQUIRED char(1) default 0^
update DF_DOC set LGI_SIGN_REQUIRED = 0^

alter table DF_DOC add LGI_SIGNING_IN_STATUS integer^

alter table DF_DOC add LGI_SIGNING_OUT_STATUS integer^