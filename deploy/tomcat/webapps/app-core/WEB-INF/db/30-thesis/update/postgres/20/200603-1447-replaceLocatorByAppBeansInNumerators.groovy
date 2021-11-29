import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.entity.Numerator

postUpdate.add({
    Persistence persistence = AppBeans.get(Persistence.NAME)
    Transaction tx = persistence.createTransaction()
    try {
        def em = persistence.entityManager
        em.softDeletion = false
        def numerators = persistence.entityManager.createQuery(
                'select n from df$Numerator n', Numerator
        ).resultList

        numerators.each { numerator ->
            numerator.script = numerator.script?.replace(
                    'def un = com.haulmont.cuba.core.Locator.lookup',
                    'def un = com.haulmont.cuba.core.global.AppBeans.get'
            )
        }

        tx.commit()
    } finally {
        tx.end()
    }
})