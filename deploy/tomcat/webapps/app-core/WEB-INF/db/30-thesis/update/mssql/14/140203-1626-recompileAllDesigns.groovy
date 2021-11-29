/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author tsarevskiy
 * @version $Id$
 */
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.workflow.ThesisWorkflowMigrationAPI

postUpdate.add({
    ThesisWorkflowMigrationAPI workflowMigrationAPI = AppBeans.get(ThesisWorkflowMigrationAPI.NAME)

    workflowMigrationAPI.recompileAllDesigns();
});