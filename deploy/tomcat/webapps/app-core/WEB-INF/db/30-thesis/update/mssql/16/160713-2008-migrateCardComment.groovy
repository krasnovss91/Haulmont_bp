/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.security.entity.User
import com.haulmont.thesis.core.entity.TsCardComment
import com.haulmont.thesis.core.enums.CardCommentType
import org.apache.commons.lang.StringUtils

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
    try {
        List<TsCardComment> cardComments = em.createQuery("select c from ts\$CardComment c").resultList;
        for (TsCardComment cardComment : cardComments) {
            TsCardComment noReplyComment = cardComment;
            if (cardComment.parent != null) {
                while (noReplyComment.parent != null) {
                    noReplyComment = noReplyComment.parent;
                }
                cardComment.parent = noReplyComment;
            }
            List<User> addressees = cardComment.addressees
            StringBuilder sb = new StringBuilder()
            for (User addresses : addressees) {
                String displayName = StringUtils.defaultString(addresses.firstName) + " " + StringUtils.defaultString(addresses.lastName)
                sb.append(displayName).append(", ")
            }
            cardComment.comment = sb.toString() + " " + cardComment.comment
            cardComment.commentType = CardCommentType.CUSTOM
        }

        tx.commit();
    } finally {
        tx.end();
    }

})