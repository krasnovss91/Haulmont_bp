update df_company set okpo = null where coalesce(trim(okpo), '') = '';
update df_contractor set inn = null where coalesce(trim(inn), '') = '';
update df_company set kpp = null where coalesce(trim(kpp), '') = '';
update df_company set ogrn = null where coalesce(trim(ogrn), '') = '';
update df_individual set egrip = null where coalesce(trim(egrip), '') = '';