/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.multi_language.MultiLanguageUpdater

postUpdate.add({
    MultiLanguageUpdater multiLanguageUpdater = AppBeans.get(MultiLanguageUpdater.NAME)
    multiLanguageUpdater.updateFieldsToMultiLanguage('ts$Group', 'name', 'locName')
    multiLanguageUpdater.updateFieldsToMultiLanguage('ts$Proc', 'name', 'locName')
})