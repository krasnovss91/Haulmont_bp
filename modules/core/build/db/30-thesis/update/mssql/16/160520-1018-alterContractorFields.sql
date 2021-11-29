-- $Id$
-- Description: adding new attributes for 1C integration

ALTER TABLE df_contractor ADD non_resident tinyint;
ALTER TABLE df_contractor ADD supplier tinyint;
ALTER TABLE df_contractor ADD customer tinyint^

UPDATE df_contractor SET non_resident=0 WHERE non_resident IS NULL;
UPDATE df_contractor SET supplier=0 WHERE supplier IS NULL;
UPDATE df_contractor SET customer=0 WHERE customer IS NULL;