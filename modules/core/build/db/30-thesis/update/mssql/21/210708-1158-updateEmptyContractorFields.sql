update df_company set okpo = null where coalesce(ltrim(rtrim(okpo)),'') = '';
update df_contractor set inn = null where coalesce(ltrim(rtrim(inn)),'') = '';
update df_company set kpp = null where coalesce(ltrim(rtrim(kpp)),'') = '';
update df_company set ogrn = null where coalesce(ltrim(rtrim(ogrn)),'') = '';
update df_individual set egrip = null where coalesce(ltrim(rtrim(egrip)),'') = '';