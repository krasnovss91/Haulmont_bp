// script_1
import com.haulmont.workflow.core.entity.Assignment
import com.haulmont.workflow.core.entity.Card
import org.apache.commons.collections.CollectionUtils

Card card = card
Set<Assignment> assignments = card.getAssignments()
assignments = assignments.findAll{ it -> card.proc.equals(it.proc) && "Dorabotka".equals(it.name)}
if (CollectionUtils.isNotEmpty(assignments)) {
    if (assignments.size() >= 1) {
        return true
    }
}
return false