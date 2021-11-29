/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */


import com.haulmont.bali.db.DbUtils
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.DbUpdater
import com.haulmont.cuba.core.sys.persistence.DbmsSpecificFactory
import com.haulmont.cuba.core.sys.persistence.MssqlSequenceSupport
import com.haulmont.thesis.core.entity.Numerator
import com.haulmont.workflow.core.app.WfUtils
import org.apache.commons.lang.StringUtils
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

import java.sql.Connection
import java.sql.Statement

import static com.haulmont.thesis.core.enums.PeriodicityType.YEAR

/**
 *
 * @author chekashkin
 * @version $Id$
 */

def sequenceSupport = DbmsSpecificFactory.getSequenceSupport()
def persistence = AppBeans.get(Persistence.NAME)
def sequencePrefix = "SEQ_UN_"

def executeSql = { String sql ->
    Connection connection = null;
    Statement statement = null;
    try {
        connection = ds.getConnection()
        statement = connection.createStatement()
        statement.execute(sql)
    } finally {
        DbUtils.closeQuietly(statement)
        DbUtils.closeQuietly(connection)
    }
}

def selectSequenceName = { String sequenceName ->
    return persistence.getEntityManager().createNativeQuery(sequenceSupport.sequenceExistsSql(sequenceName))
            .getFirstResult()
}

postUpdate.add({
    Transaction tx = persistence.createTransaction()
    Log log = LogFactory.getLog(DbUpdater.class)

    try {
        EntityManager em = persistence.getEntityManager()
        List<Numerator> numerators = em.createQuery("select n from df\$Numerator n" +
                " where n.scriptEnabled = false", Numerator.class)
                .getResultList()

        List<Numerator> numeratorsToUpdate = numerators.findAll {
            WfUtils.Translit.toTranslit(it.code ?: "").contains("_") || (it.periodicity && YEAR != it.periodicity)
        }

        if (numeratorsToUpdate) {
            numeratorsToUpdate.each {
                def oldSequenceName = WfUtils.Translit.toTranslit(it.code).toLowerCase()
                List<String> sequencesToUpdate
                if (sequenceSupport instanceof MssqlSequenceSupport) {
                    sequencesToUpdate = em.createNativeQuery("select TABLE_NAME from INFORMATION_SCHEMA.TABLES " +
                            "where lower(TABLE_NAME) like 'seq_un_$oldSequenceName%'")
                            .getResultList()
                } else {
                    sequencesToUpdate = em.createNativeQuery("select NAME from SYS.SEQUENCES " +
                            "where lower(NAME) like 'seq_un_$oldSequenceName%'")
                            .getResultList()
                }

                Map<String, String> sequenceRenameMap = [:]
                if (sequencesToUpdate) {
                    sequencesToUpdate.each { String sequenceName ->
                        sequenceName = sequenceName.toUpperCase()
                        def newSequenceName = sequencePrefix + StringUtils.substringAfterLast(sequenceName, sequencePrefix)
                                .replaceAll("_", "")
                                .replaceAll("VHODYASHIIKONSTR", "VHODYASHIIKONST")

                        if (!sequenceName.equals(newSequenceName))
                            sequenceRenameMap.put(sequenceName, newSequenceName)
                    }
                }

                sequenceRenameMap.each { oldName, newName ->
                    if (selectSequenceName(newName))
                        log.info("Sequence $newName already exist, old sequence won't be renamed")
                    else {
                        log.info("Updating sequence $oldName to $newName")
                        String renameSequenceSql = "exec sp_rename '$oldName', '$newName';"
                        executeSql(renameSequenceSql)
                    }
                }
            }
        } else {
            log.info("No sequences to update")
        }
    } finally {
        tx.end()
    }
})