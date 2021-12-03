// script_2
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.workflow.core.entity.Card
import com.haulmont.workflow.core.entity.CardInfo
import com.haulmont.cuba.security.entity.User
import org.apache.commons.collections.CollectionUtils
List<User> getSubdivisionChiefUser() {
    Persistence persistence = AppBeans.get(Persistence.NAME);
    EntityManager em = persistence.getEntityManager();
    List<User> subdivisionChiefUserList = em.createQuery("select ur.user from sec\$UserRole ur" + "left join ur.role r where r.name='SubdivisionChief'")
    .getResultList();
    return subdivisionChiefUserList;
}
void createCardInfo(Card card, User user, String subject){
    Persistence persistence = AppBeans.get(Persistence.NAME)
    String jbpmProcessKey = card.getProc() == null ? "" : card.getProc().getJbpmProcessKey()
    CardInfo ci = new CardInfo();
    ci.setCard(card)
    ci.setType(CardInfo.TYPE_NOTIFICATION);
    ci.setUser(user)
    ci.setDescription(subject)
    ci.setJbpmExecutionId(jbpmProcessKey)
    EntityManager em = persistence.getEntityManager()
    em.persist(ci)
}
Card card = new Card()
List<User> subdivisionChiefUser = getSubdivisionChiefUser() {
    if (CollectionUtils.isNotEmpty(subdivisionChiefUser)){
        String subject = "Обратите внимание на документ" + card.instanceName
        subdivisionChiefUser.each {user ->
            createCardInfo(card,user,subject)
        }
    }
}