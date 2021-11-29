/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */


package com.haulmont.thesis.core.importer.scripts

import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Metadata
import com.haulmont.thesis.core.entity.Doc
import com.haulmont.thesis.core.entity.SimpleDoc

class SimpleDocImportScript extends DocImportScript {



    public Doc createEntity() {
        return AppBeans.get(Metadata.class).create(SimpleDoc.class);
    }

    @Override
    void setSpecialSimpleValues(Doc doc) {
        SimpleDoc simpleDoc = (SimpleDoc) doc;
        simpleDoc.setOrderCause((String) properties.get("orderCause"));
        simpleDoc.setOrderText((String) properties.get("orderText"));
    }
}
