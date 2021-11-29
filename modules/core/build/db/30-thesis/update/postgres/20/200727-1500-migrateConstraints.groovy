import com.google.common.collect.Lists;
import com.haulmont.cuba.core.Persistence;
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans;
import com.haulmont.cuba.core.global.TimeSource;
import com.haulmont.cuba.core.sys.AppContext;
import com.haulmont.cuba.security.entity.Constraint;
import com.haulmont.cuba.security.entity.Group;
import com.haulmont.cuba.core.sys.DbUpdater;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.io.FileUtils;

import java.util.List;
import java.util.UUID;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.text.SimpleDateFormat;

postUpdate.add({
    File logFile = new File(AppContext.getProperty('cuba.logDir'), 'thesis_v5_constraints_update.log')

    String result = new ConstraintsMigrationHelper().migrate()
    printResultToFile(logFile, result)

    Log log = LogFactory.getLog(DbUpdater.class)
    log.info('See constraints migration result log in: ' + logFile.getAbsolutePath())
})

def printResultToFile(File file, String result) {
    FileUtils.writeStringToFile(file, result, 'UTF-8', true)
}

class ConstraintsMigrationHelper {
    static final UUID ARCHIVIST_GROUP_ID = UUID.fromString("cff945e4-e363-0dc0-d70d-4b5bdb2a2269");
    static final UUID SECRETARY_GROUP_ID = UUID.fromString("7dfe5c72-073f-4e1e-9cf4-1b1bad9c0093");
    static final UUID LIMITED_ACCESS_GROUP_ID = UUID.fromString("8e6306e2-9e10-414a-b437-24c91ffef804");
    static final UUID LIMITED_ACCESS_AND_CONTRACTS_GROUP_ID = UUID.fromString("9e44a053-a31f-4edd-b19b-39e942161dd2");
    static final UUID LIMITED_ACCESS_AND_DOCS_GROUP_ID = UUID.fromString("b3dc60f5-65b2-47ab-8802-9e8929bf8b29");
    static final UUID HEAD_OF_DEP_GROUP_ID = UUID.fromString("9fa89a54-9ffa-11e1-b13e-9f4a54bff17e");
    static final UUID HEAD_OF_PODR_GROUP_ID = UUID.fromString("8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb");

    static final List<String> entityNamesConstraintsToDelete = Lists.newArrayList(
            'df$SimpleDoc', 'df$MeetingDoc', 'df$Contract', 'df$AccountDoc');

    String migrate() {
        return AppBeans.get(Persistence.class).createTransaction().execute({ em ->
            em.setSoftDeletion(false);

            final List<Constraint> allConstraints = Lists.newArrayList(
                    em.createQuery('select c from sec$Constraint c', Constraint.class).getResultList());

            List<String> result = Lists.newArrayList();
            result.add(String.format('\nConstraints update info from %s :',
                    new SimpleDateFormat("dd.MM.yyyy HH:mm:ss").format(AppBeans.get(TimeSource.class).currentTimestamp())));

            removeDocsEffectiveConstraints(allConstraints, result);

            migrateUserGroupsAndTypicalResolutionsAndOtherSame(allConstraints, result);
            migrateArchivistConstraints(allConstraints, result);
            migrateLimitedAccessAndContractsConstraints(allConstraints, result);
            migrateLimitedAccessAndDocsConstraints(allConstraints, result);
            migrateHeadGroupsConstraints(allConstraints, result);

            migrateTaskConstraintsAndOtherSame(allConstraints, result);
            migrateTaskPatternConstraints(allConstraints, result);
            migrateTaskGroupConstraints(allConstraints, result);

            overrideJoinClause(allConstraints, ', ts$CardAcl acl', 'left outer join {E}.aclList acl', result);
            replaceInWhereClause(allConstraints, '{E}.id = acl.card.id and', '', result);
            replaceInWhereClause(allConstraints, 'in (:session$departmentIds)', 'in :session$departmentIds', result);
            replaceInWhereClause(allConstraints, 'in (:session$departmentMembersIds)', 'in :session$departmentMembersIds', result);

            result = result.stream()
                    .filter({ s -> StringUtils.isNotBlank(s) } as Predicate)
                    .collect(Collectors.toList());
            String resultString = StringUtils.join(result, '\n\n------------------------------------------------------------------------------------------------------------------\n');

            em.setSoftDeletion(true);
            return resultString;
        } as Transaction.Callable);
    }

    void removeDocsEffectiveConstraints(List<Constraint> constraints, List<String> result) {
        List<Constraint> toRemove = selectConstraints(constraints,
                { c -> entityNamesConstraintsToDelete.contains(c.getEntityName()) && c.getDeleteTs() == null } as Predicate
        );

        for (Constraint constraint : toRemove) {
            String expectedJoin = getExpectedEffectiveDocJoinClause(constraint);
            String expectedWhere = getExpectedEffectiveDocWhereClause(constraint);
            if (isSameExpr(constraint.getJoinClause(), expectedJoin) && isSameExpr(constraint.getWhereClause(), expectedWhere)) {
                AppBeans.get(Persistence.class).getEntityManager().remove(constraint);
                constraints.remove(constraint);
                result.add(buildResultString(constraint, 'DELETED'));
            }
        }
    }

    String getExpectedEffectiveDocJoinClause(Constraint constraint) {
        UUID groupId = constraint.getGroup() != null ? constraint.getGroup().getId() : null;
        if (groupId == null)
            return null;

        if (ARCHIVIST_GROUP_ID.equals(groupId))
            return 'join {E}.aclList acl';

        return ', ts$CardAcl acl';
    }

    String getExpectedEffectiveDocWhereClause(Constraint constraint) {
        UUID groupId = constraint.getGroup() != null ? constraint.getGroup().getId() : null;
        if (groupId == null)
            return null;

        if (ARCHIVIST_GROUP_ID.equals(groupId))
            return '{E}.docOfficeData.officeFile.state >= 30 and {E}.template = false or (acl.user.id = :session$userId or acl.global = true)';

        if (HEAD_OF_DEP_GROUP_ID.equals(groupId) || HEAD_OF_PODR_GROUP_ID.equals(groupId))
            return '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true)';

        return '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)';
    }

    void migrateUserGroupsAndTypicalResolutionsAndOtherSame(List<Constraint> constraints, List<String> result) {
        List<Constraint> simpleRefConstraints = selectConstraints(constraints,
                byJoinClause(null),
                byWhereClause('{E}.substitutedCreator.id = :session$userId or {E}.global = true')
                        .or(byWhereClause('{E}.global = true or {E}.substitutedCreator.id = :session$userId'))
        );
        setNewWhereClause(simpleRefConstraints, result, '{E}.substitutedCreator.id = :session$userId or {E}.global = true');
    }

    void migrateArchivistConstraints(List<Constraint> constraints, List<String> result) {
        List<Constraint> archivistConstraints = selectConstraints(constraints,
                byGroupId(ARCHIVIST_GROUP_ID),
                byJoinClause('join {E}.aclList acl'),
                byWhereClause('{E}.docOfficeData.officeFile.state >= 30 and {E}.template = false or (acl.user.id = :session$userId or acl.global = true)')
        );
        setNewJoinAndWhereClause(archivistConstraints, result,
                'left outer join {E}.aclList acl left outer join {E}.docOfficeData dod left outer join dod.officeFile file',
                'file.state >= 30 and {E}.template = false or acl.user.id = :session$userId or acl.global = true');
    }

    void migrateLimitedAccessAndContractsConstraints(List<Constraint> constraints, List<String> result) {
        List<Constraint> docConstraints = selectConstraints(constraints,
                byGroupId(LIMITED_ACCESS_AND_CONTRACTS_GROUP_ID),
                byEntityName('df$Doc'),
                byJoinClause(', ts$CardAcl acl'),
                byWhereClause('{E}.id = acl.card.id and (TYPE({E}) in (:session$contractEffectiveClass) or acl.user.id = :session$userId or acl.global = true)')
        );
        setNewJoinAndWhereClause(docConstraints, result,
                'left outer join {E}.aclList acl',
                'TYPE({E}) in (:session$contractEffectiveClass) or acl.user.id = :session$userId or acl.global = true');
    }

    void migrateLimitedAccessAndDocsConstraints(List<Constraint> constraints, List<String> result) {
        List<Constraint> docConstraints = selectConstraints(constraints,
                byGroupId(LIMITED_ACCESS_AND_DOCS_GROUP_ID),
                byEntityName('df$Doc'),
                byJoinClause(', ts$CardAcl acl'),
                byWhereClause('{E}.id = acl.card.id and (TYPE({E}) in (:session$simpleDocEffectiveClass, :session$accountDocEffectiveClass) or acl.user.id = :session$userId or acl.global = true)')
        );
        setNewJoinAndWhereClause(docConstraints, result,
                'left outer join {E}.aclList acl',
                'TYPE({E}) in (:session$simpleDocEffectiveClass, :session$accountDocEffectiveClass) or acl.user.id = :session$userId or acl.global = true');
    }

    void migrateHeadGroupsConstraints(List<Constraint> constraints, List<String> result) {
        List<Constraint> headConstraints = selectConstraints(constraints,
                byGroupId(HEAD_OF_DEP_GROUP_ID).or(byGroupId(HEAD_OF_PODR_GROUP_ID))
        );

        List<Constraint> taskConstraints = selectConstraints(headConstraints,
                byJoinClause(', ts$CardAcl acl'),
                byWhereClause('{E}.id = acl.card.id and (acl.department.id in (:session$departmentIds) or acl.user.id = :session$userId)')
        );
        setNewJoinAndWhereClause(taskConstraints, result,
                'left outer join {E}.aclList acl',
                'acl.department.id in :session$departmentIds or acl.user.id = :session$userId');

        List<Constraint> docConstraints = selectConstraints(headConstraints,
                byJoinClause(', ts$CardAcl acl'),
                byWhereClause('{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true)')
        );
        setNewJoinAndWhereClause(docConstraints, result,
                'left outer join {E}.aclList acl',
                'acl.user.id = :session$userId or acl.department.id in :session$departmentIds or acl.global = true');

        List<Constraint> taskGroupConstraints = selectConstraints(headConstraints,
                byJoinClause('left join {E}.taskGroupTasks tgt'),
                byWhereClause('{E}.subCreator.id=:session$userId OR ({E}.global = true AND {E}.template=true) ' +
                        'OR tgt.task.id in (select t.id from tm$Task t left join t.roles r  where t.substitutedCreator.id = ' +
                        ':session$userId OR r.user.id in (:session$departmentMembersIds))')
        );
        setNewJoinAndWhereClause(taskGroupConstraints, result,
                'left join {E}.taskGroupTasks tgt left outer join tgt.task task',
                '{E}.subCreator.id = :session$userId or {E}.global = true and {E}.template = true or task.id in (select t.id from tm$Task t left join t.roles r where t.substitutedCreator.id = :session$userId or r.user.id in :session$departmentMembersIds)');
    }

    void migrateTaskConstraintsAndOtherSame(List<Constraint> constraints, List<String> result) {
        List<Constraint> simpleCardConstraints = selectConstraints(constraints,
                byJoinClause(', ts$CardAcl acl'),
                byWhereClause('{E}.id = acl.card.id and acl.user.id = :session$userId')
        );
        setNewJoinAndWhereClause(simpleCardConstraints, result,
                'left outer join {E}.aclList acl',
                'acl.user.id = :session$userId');
    }

    void migrateTaskPatternConstraints(List<Constraint> constraints, List<String> result) {
        List<Constraint> taskPatternConstraints = selectConstraints(constraints,
                byJoinClause(', ts$CardAcl acl'),
                byWhereClause('{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)')
        );
        setNewJoinAndWhereClause(taskPatternConstraints, result,
                'left outer join {E}.aclList acl',
                'acl.user.id = :session$userId or acl.global = true');
    }

    void migrateTaskGroupConstraints(List<Constraint> constraints, List<String> result) {
        List<Constraint> taskGroupConstraints = selectConstraints(constraints,
                byJoinClause('left join {E}.taskGroupTasks tgt'),
                byWhereClause('{E}.subCreator.id = :session$userId or exists (select c from wf$CardRole c where c.card = tgt.task and c.user.id = :session$userId and c.deleteTs is null) or ({E}.template = true and {E}.global = true)')
                        .or(byWhereClause('{E}.subCreator.id = :session$userId or exists (select c from wf$CardRole c where c.card = tgt.task and c.user.id = :session$userId and c.deleteTs is null) or {E}.template = true and {E}.global = true'))
                        .or(byWhereClause('{E}.subCreator.id = :session$userId or exists (select c from wf$CardRole c where c.card = tgt.task and c.user.id = :session$userId and c.deleteTs is null) or ({E}.global = true)'))
                        .or(byWhereClause('{E}.subCreator.id = :session$userId or exists (select c from wf$CardRole c where c.card = tgt.task and c.user.id = :session$userId and c.deleteTs is null) or {E}.global = true'))
        );
        setNewJoinAndWhereClause(taskGroupConstraints, result,
                'left join {E}.taskGroupTasks tgt left join tgt.task t',
                '{E}.subCreator.id = :session$userId or exists (select c.id from wf$CardRole c where c.card.id = t.id and c.user.id = :session$userId) or {E}.template = true and {E}.global = true');
    }

    void setNewWhereClause(List<Constraint> constraints, List<String> result, String newWhere) {
        for (Constraint constraint : constraints) {
            String oldWhere = constraint.getWhereClause();
            constraint.setWhereClause(newWhere);
            result.add(buildChangedResultString(constraint, oldWhere));
        }
    }

    void setNewJoinAndWhereClause(List<Constraint> constraints, List<String> result, String newJoin, String newWhere) {
        for (Constraint constraint : constraints) {
            String oldJoin = constraint.getJoinClause();
            String oldWhere = constraint.getWhereClause();
            constraint.setJoinClause(newJoin);
            constraint.setWhereClause(newWhere);
            result.add(buildChangedResultString(constraint, oldJoin, oldWhere));
        }
    }

    void overrideJoinClause(List<Constraint> constraints, String oldExpr, String newExpr, List<String> result) {
        for (Constraint constraint : constraints) {
            String joinClause = constraint.getJoinClause();
            if (StringUtils.isNotBlank(joinClause) && isSameExpr(joinClause, oldExpr)) {

                constraint.setJoinClause(newExpr);
                result.add(buildJoinClauseChangedResultString(constraint, joinClause));
            }
        }
    }

    void replaceInWhereClause(List<Constraint> constraints, String oldExpr, String newExpr, List<String> result) {
        for (Constraint constraint : constraints) {
            String whereClause = constraint.getWhereClause();
            if (StringUtils.isNotBlank(whereClause) && whereClause.contains(oldExpr)) {

                String newWhere = StringUtils.replace(whereClause, oldExpr, newExpr);
                constraint.setWhereClause(newWhere);
                result.add(buildChangedResultString(constraint, whereClause));
            }
        }
    }

    List<Constraint> selectConstraints(List<Constraint> constraints, Predicate<Constraint>... predicates) {
        Stream<Constraint> stream = constraints.stream();
        for (Predicate<Constraint> predicate : predicates)
            stream = stream.filter(predicate);
        return stream.collect(Collectors.toList());
    }

    Predicate<Constraint> byGroupId(UUID groupId) {
        return { c -> c.getGroup() != null && c.getGroup().getId().equals(groupId) };
    }

    Predicate<Constraint> byEntityName(String entityName) {
        return { c -> entityName.equals(c.getEntityName()) };
    }

    Predicate<Constraint> byJoinClause(String expected) {
        return { c -> isSameExpr(c.getJoinClause(), expected) };
    }

    Predicate<Constraint> byWhereClause(String expected) {
        return { c -> isSameExpr(c.getWhereClause(), expected) };
    }

    boolean isSameExpr(String current, String expected) {
        if (expected == null && current == null)
            return true;
        String currentToCompare = getExpressionToCompare(current);
        if (currentToCompare == null)
            return false;

        String expectedToCompare = getExpressionToCompare(expected);
        if (currentToCompare.equals(expectedToCompare))
            return true;

        if (currentToCompare.equals("(" + expectedToCompare + ")"))
            return true;

        return false;
    }

    String getExpressionToCompare(String expr) {
        if (expr == null)
            return null;
        if (StringUtils.isBlank(expr))
            return "";
        return expr.toLowerCase().replaceAll("\\s", "");
    }

    String buildResultString(Constraint constraint, String comment) {
        String constraintInfo = String.format("%s", constraint.getEntityName());
        String groupInfo = "";
        Group group = constraint.getGroup();
        if (group != null)
            groupInfo = String.format("%s %s", group.getName(), group.getId());

        return String.format("Constraint [%s] from Group [%s]: %s", constraintInfo, groupInfo, comment);
    }

    String buildJoinClauseChangedResultString(Constraint constraint, String oldJoinClause) {
        if (StringUtils.equals(oldJoinClause, constraint.getJoinClause()))
            return "";
        String result = buildResultString(constraint, "");
        result += "\nJOIN CLAUSE CHANGED\nfrom:\n" + oldJoinClause + "\nto:\n" + constraint.getJoinClause();
        return result;
    }

    String buildChangedResultString(Constraint constraint, String oldWhereClause) {
        if (StringUtils.equals(oldWhereClause, constraint.getWhereClause()))
            return "";
        String result = buildResultString(constraint, "");
        result += "\nWHERE CLAUSE CHANGED\nfrom:\n" + oldWhereClause + "\nto:\n" + constraint.getWhereClause();
        return result;
    }

    String buildChangedResultString(Constraint constraint, String oldJoinClause, String oldWhereClause) {
        if (StringUtils.equals(oldJoinClause, constraint.getJoinClause()) && StringUtils.equals(oldWhereClause, constraint.getWhereClause()))
            return "";
        String result = buildResultString(constraint, "");
        result += "\nJOIN CLAUSE CHANGED\nfrom:\n" + oldJoinClause + "\nto:\n" + constraint.getJoinClause();
        result += "\nWHERE CLAUSE CHANGED\nfrom:\n" + oldWhereClause + "\nto:\n" + constraint.getWhereClause();
        return result;
    }
}