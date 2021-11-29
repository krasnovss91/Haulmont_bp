-- $Id$
-- Description:

delete from sec_permission where role_id = '0038f3db-ac9c-4323-83e7-356996cc63ae' and target in ('tm$TaskPattern:update', 'tm$TaskPattern:delete',
       'tm$TaskPatternGroup:create', 'tm$TaskPatternGroup:update', 'tm$TaskPatternGroup:delete',
       'tm$TaskType:create', 'tm$TaskType:update', 'tm$TaskType:delete');