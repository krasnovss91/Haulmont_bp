-- $Id$
-- Description: adding new attributes for 1C integration

ALTER TABLE df_contractor ADD COLUMN non_resident BOOLEAN;
ALTER TABLE df_contractor ADD COLUMN supplier BOOLEAN;
ALTER TABLE df_contractor ADD COLUMN customer BOOLEAN;

UPDATE df_contractor SET non_resident=FALSE WHERE non_resident IS NULL;
UPDATE df_contractor SET supplier=FALSE WHERE supplier IS NULL;
UPDATE df_contractor SET customer=FALSE WHERE customer IS NULL;