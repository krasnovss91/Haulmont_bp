/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */


import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.legaldoc.OperatorEdmTools
import com.haulmont.thesis.core.entity.OperatorEdm
import org.apache.commons.lang.StringUtils

postUpdate.add({
    AppBeans.get(Persistence.class).createTransaction().execute(new Transaction.Runnable() {
        @Override
        void run(EntityManager em) {
            em.setSoftDeletion(false)
            def operatorEdmTools = AppBeans.get(OperatorEdmTools.class)

            List<OperatorEdm> operators = em.createQuery('select o from ts$OperatorEdm o', OperatorEdm.class).getResultList()
            operators.each { operator ->
                String password = operator.getPassword()
                if (StringUtils.isBlank(password))
                    return

                operator.setPassword(operatorEdmTools.encryptPassword(password))
            }

            em.setSoftDeletion(true)
        }
    })
})