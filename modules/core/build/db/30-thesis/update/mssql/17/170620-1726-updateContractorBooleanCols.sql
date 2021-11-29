-- $Id$

update DF_CONTRACTOR SET NON_RESIDENT = 0 where NON_RESIDENT is null;
update DF_CONTRACTOR SET SUPPLIER = 0 where SUPPLIER is null;
update DF_CONTRACTOR SET CUSTOMER = 0 where CUSTOMER is null;