-- $Id$

update DF_CONTRACTOR set NON_RESIDENT = false where NON_RESIDENT is null;
update DF_CONTRACTOR set SUPPLIER = false where SUPPLIER is null;
update DF_CONTRACTOR set CUSTOMER = false where CUSTOMER is null;