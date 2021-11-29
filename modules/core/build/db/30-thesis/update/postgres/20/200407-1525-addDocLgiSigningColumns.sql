alter table DF_DOC add LGI_SIGN_REQUIRED boolean default false^
update DF_DOC set LGI_SIGN_REQUIRED = false^

alter table DF_DOC add LGI_SIGNING_IN_STATUS integer^

alter table DF_DOC add LGI_SIGNING_OUT_STATUS integer^