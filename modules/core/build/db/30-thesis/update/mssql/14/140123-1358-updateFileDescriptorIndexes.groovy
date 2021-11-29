/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.fts.ThesisFtsManagerAPI


ThesisFtsManagerAPI ftsManagerAPI = AppBeans.get(ThesisFtsManagerAPI.NAME);
ftsManagerAPI.updateEntities("core\$FileDescriptor", "sys\$FileDescriptor");
ftsManagerAPI.updateEntities("ts\$CardAttachment", "wf\$CardAttachment");
ftsManagerAPI.updateEntities("df\$ContractorAttachment", "df\$CorrespondentAttachment");