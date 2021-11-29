-- $Id$
-- Description:
DO $$
BEGIN

IF NOT EXISTS (
    SELECT 1
    FROM   pg_indexes c
    WHERE  c.indexname = 'idx_wf_card_info_activity_execution_id'
    ) THEN

    CREATE INDEX IDX_WF_CARD_INFO_ACTIVITY_EXECUTION_ID ON WF_CARD_INFO (JBPM_EXECUTION_ID,ACTIVITY);
END IF;

END$$;
