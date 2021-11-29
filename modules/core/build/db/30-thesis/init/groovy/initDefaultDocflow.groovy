import com.haulmont.thesis.core.app.ThesisConstants
import com.haulmont.thesis.core.entity.TsProc
import com.haulmont.thesis.core.entity.TsProcRole
import com.haulmont.thesis.core.entity.TsRole
import com.haulmont.thesis.core.process.*
import com.haulmont.thesis.utils.initdsl.InitDsl

import static com.haulmont.thesis.utils.initdsl.InitDsl.init
import static com.haulmont.workflow.core.entity.OrderFillingType.PARALLEL


/**
 * IMPORTANT
 *
 * This update script updates only processes wasn't changed by the users (updatedBy field is null or 'system')
 *
 * So if you need to change some settings for the all processes, you should write new database update script for it
 *
*/
String UPDATED_BY_WHERE_CONDITION = '{E}.updatedBy is null or {E}.updatedBy = \'system\''

init {
    entities(TsProc, ['jbpmProcessKey'], UPDATED_BY_WHERE_CONDITION, true) {
        simpleEntity {
            name = 'Ознакомление'
            locName = multiLanguageString('Ознакомление', 'Submit for Review')
            jbpmProcessKey = AcquaintanceConstants.PROC_NAME
            participantsChangeEnabled = true
            cardTypes = ',df$SimpleDoc,df$Contract,df$AccountDoc,df$Doc,'
            availableForMobileClient = true
        }
    }

    entities(TsProcRole, ['code', 'proc'], UPDATED_BY_WHERE_CONDITION, true) {
        build {
            proc = find(TsProc) { code = AcquaintanceConstants.PROC_NAME }
        }

        simpleEntity {
            name = 'Инициатор'
            locName = multiLanguageString('Инициатор', 'Initiator')
            code = AcquaintanceConstants.PROC_ROLE_INITIATOR
            role = getRole(ThesisConstants.SEC_ROLE_DOC_INITIATOR)
            sortOrder = 1
        }

        simpleEntity {
            name = 'Ознакомляющийся'
            locName = multiLanguageString('Ознакомляющийся', 'Reviewer')
            orderFillingType = PARALLEL
            multiUser = true
            code = AcquaintanceConstants.PROC_ROLE_ACQUAINTANCE
            role = getRole(ThesisConstants.SEC_ROLE_DOC_ACQUAINTANCE)
            sortOrder = 2
        }
    }
}

init {
    entities(TsProc, ['jbpmProcessKey'], UPDATED_BY_WHERE_CONDITION, true) {
        simpleEntity {
            name = 'Регистрация'
            jbpmProcessKey = RegistrationConstants.PROC_NAME
            cardTypes = ',df$SimpleDoc,df$AccountDoc,df$Doc,'
            locName = multiLanguageString('Регистрация', 'Registration')
        }
    }

    entities(TsProcRole, ['code', 'proc'], UPDATED_BY_WHERE_CONDITION, true) {
        build {
            proc = find(TsProc) { code = RegistrationConstants.PROC_NAME }
        }

        simpleEntity {
            name = 'Инициатор'
            locName = multiLanguageString('Инициатор', 'Initiator')
            code = RegistrationConstants.PROC_ROLE_INITIATOR
            role = getRole(ThesisConstants.SEC_ROLE_DOC_INITIATOR)
            sortOrder = 1
        }
        simpleEntity {
            name = 'Секретарь'
            locName = multiLanguageString('Секретарь', 'Secretary')
            code = RegistrationConstants.PROC_ROLE_SECRETARY
            role = getRole(ThesisConstants.SEC_ROLE_DOC_SECRETARY)
            sortOrder = 2
        }
    }
}

init {
    entities(TsProc, ['jbpmProcessKey'], UPDATED_BY_WHERE_CONDITION, true) {
        simpleEntity {
            name = 'Резолюция'
            availableForMobileClient = true
            jbpmProcessKey = ResolutionConstants.PROC_NAME
            cardTypes = ',df$SimpleDoc,df$Doc,'
            locName = multiLanguageString('Резолюция', 'Resolution')
        }
    }

    entities(TsProcRole, ['code', 'proc'], UPDATED_BY_WHERE_CONDITION, true) {
        build {
            proc = find(TsProc) { code = ResolutionConstants.PROC_NAME }
        }

        simpleEntity {
            name = 'Инициатор'
            locName = multiLanguageString('Инициатор', 'Initiator')
            code = ResolutionConstants.PROC_ROLE_INITIATOR
            role = getRole(ThesisConstants.SEC_ROLE_DOC_INITIATOR)
            sortOrder = 1
        }
        simpleEntity {
            name = 'Утверждающий'
            locName = multiLanguageString('Утверждающий', 'Approver')
            code = ResolutionConstants.PROC_ROLE_APPROVER
            role = getRole(ThesisConstants.SEC_ROLE_DOC_APPROVER)
            sortOrder = 2
        }
    }
}

init {
    entities(TsProc, ['jbpmProcessKey'], UPDATED_BY_WHERE_CONDITION, true) {
        simpleEntity {
            name = 'Согласование'
            locName = multiLanguageString('Согласование', 'Endorsement')
            jbpmProcessKey = EndorsementConstants.PROC_NAME
            cardTypes = ',df$SimpleDoc,df$Contract,df$AccountDoc,df$Doc,df$PackageDoc,'
            availableForMobileClient = true
            combinedStagesEnabled = true
            availableEde = true
            availableEdeSessionTypes = '40'
        }
    }

    entities(TsProcRole, ['code', 'proc'], UPDATED_BY_WHERE_CONDITION, true) {
        build {
            proc = find(TsProc) { code = EndorsementConstants.PROC_NAME }
        }

        simpleEntity {
            name = 'Инициатор'
            locName = multiLanguageString('Инициатор', 'Initiator')
            role = getRole(ThesisConstants.SEC_ROLE_DOC_INITIATOR)
            code = EndorsementConstants.PROC_ROLE_INITIATOR
            sortOrder = 1
            edeSessionInitiatorAuthorities = true
        }
        simpleEntity {
            name = 'Согласующий'
            locName = multiLanguageString('Согласующий', 'Reviewer')
            role = getRole(ThesisConstants.SEC_ROLE_DOC_ENDORSEMENT)
            code = EndorsementConstants.PROC_ROLE_ENDORSEMENT
            orderFillingType = PARALLEL
            multiUser = true
            sortOrder = 2
        }
        simpleEntity {
            name = 'Утверждающий'
            locName = multiLanguageString('Утверждающий', 'Approver')
            role = getRole(ThesisConstants.SEC_ROLE_DOC_APPROVER)
            code = EndorsementConstants.PROC_ROLE_APPROVER
            sortOrder = 3
        }
        simpleEntity {
            name = 'Секретарь'
            locName = multiLanguageString('Секретарь', 'Secretary')
            role = getRole(ThesisConstants.SEC_ROLE_DOC_SECRETARY)
            code = EndorsementConstants.PROC_ROLE_SECRETARY
            sortOrder = 4
        }
    }
}
init {
    entities(TsProc, ['jbpmProcessKey'], UPDATED_BY_WHERE_CONDITION, true) {
        simpleEntity {
            name = 'Согласование протокола'
            locName = multiLanguageString('Согласование протокола', 'Review protocol')
            jbpmProcessKey = ProtocolEndorsementConstants.PROC_NAME
            cardTypes = ',df$MeetingDoc,'
            availableForMobileClient = true
            combinedStagesEnabled = true
        }
    }

    entities(TsProcRole, ['code', 'proc'], UPDATED_BY_WHERE_CONDITION, true) {
        build {
            proc = find(TsProc) { code = ProtocolEndorsementConstants.PROC_NAME }
        }

        simpleEntity {
            name = 'Инициатор'
            locName = multiLanguageString('Инициатор', 'Initiator')
            role = getRole(ThesisConstants.SEC_ROLE_DOC_INITIATOR)
            code = ProtocolEndorsementConstants.PROC_ROLE_INITIATOR
            sortOrder = 1
        }
        simpleEntity {
            name = 'Согласующий'
            locName = multiLanguageString('Согласующий', 'Reviewer')
            role = getRole(ThesisConstants.SEC_ROLE_DOC_ENDORSEMENT)
            code = ProtocolEndorsementConstants.PROC_ROLE_ENDORSEMENT
            orderFillingType = PARALLEL
            multiUser = true
            sortOrder = 2
        }
        simpleEntity {
            name = 'Утверждающий'
            locName = multiLanguageString('Утверждающий', 'Approver')
            role = getRole(ThesisConstants.SEC_ROLE_DOC_APPROVER)
            code = ProtocolEndorsementConstants.PROC_ROLE_APPROVER
            sortOrder = 3
        }
    }
}

init {
    entities(TsProc, ['jbpmProcessKey'], UPDATED_BY_WHERE_CONDITION, true) {
        simpleEntity {
            name = 'Согласование повестки'
            locName = multiLanguageString('Согласование повестки', 'Review agenda')
            jbpmProcessKey = AgendaEndorsementConstants.PROC_NAME
            cardTypes = ',df$MeetingDoc,'
            availableForMobileClient = true
            combinedStagesEnabled = true
        }
    }

    entities(TsProcRole, ['code', 'proc'], UPDATED_BY_WHERE_CONDITION, true) {
        build {
            proc = find(TsProc) { code = AgendaEndorsementConstants.PROC_NAME }
        }

        simpleEntity {
            name = 'Инициатор'
            locName = multiLanguageString('Инициатор', 'Initiator')
            role = getRole(ThesisConstants.SEC_ROLE_DOC_INITIATOR)
            code = AgendaEndorsementConstants.PROC_ROLE_INITIATOR
            sortOrder = 1
        }
        simpleEntity {
            name = 'Согласующий'
            locName = multiLanguageString('Согласующий', 'Reviewer')
            role = getRole(ThesisConstants.SEC_ROLE_DOC_ENDORSEMENT)
            code = AgendaEndorsementConstants.PROC_ROLE_ENDORSEMENT
            orderFillingType = PARALLEL
            multiUser = true
            sortOrder = 2
        }
        simpleEntity {
            name = 'Утверждающий'
            locName = multiLanguageString('Утверждающий', 'Approver')
            role = getRole(ThesisConstants.SEC_ROLE_DOC_APPROVER)
            code = AgendaEndorsementConstants.PROC_ROLE_APPROVER
            sortOrder = 3
        }
    }
}

init {
    entities(TsProc, ['jbpmProcessKey'], UPDATED_BY_WHERE_CONDITION, true) {
        simpleEntity {
            name = 'Обработка входящего из ЭДО'
            locName = multiLanguageString('Обработка входящего из ЭДО', 'EDM inbound processing')
            jbpmProcessKey = EdmReceivingConstants.PROC_CODE
            cardTypes = ',df$SimpleDoc,'
            availableForMobileClient = false
            availableMailActivity = false
        }
    }

    entities(TsProcRole, ['code', 'proc'], UPDATED_BY_WHERE_CONDITION, true) {
        build {
            proc = find(TsProc) { code = EdmReceivingConstants.PROC_CODE }
        }

        simpleEntity {
            name = 'Куратор ЭДО'
            locName = multiLanguageString('Куратор ЭДО', 'EDM curator')
            role = find(TsRole) { name = ThesisConstants.SEC_ROLE_EDM_CURATOR }
            code = EdmReceivingConstants.EDM_CURATOR_ROLE
            sortOrder = 1
        }
        simpleEntity {
            name = 'Подписант'
            locName = multiLanguageString('Подписант', 'Signer')
            role = getRole(ThesisConstants.SEC_ROLE_DOC_APPROVER)
            code = EdmReceivingConstants.SIGNER_ROLE
            sortOrder = 2
        }
        simpleEntity {
            name = 'Секретарь'
            locName = multiLanguageString('Секретарь', 'Secretary')
            role = getRole(ThesisConstants.SEC_ROLE_DOC_SECRETARY)
            code = EdmReceivingConstants.SECRETARY_ROLE
            sortOrder = 3
        }
    }
}

init {
    entities(TsProc, ['jbpmProcessKey'], UPDATED_BY_WHERE_CONDITION, true) {
        simpleEntity {
            name = 'Обработка входящего пакета из ЭДО'
            locName = multiLanguageString('Обработка входящего пакета из ЭДО', 'EDM inbound package processing')
            jbpmProcessKey = EdmPackageReceivingConstants.PROC_CODE
            cardTypes = ',df$PackageDoc,'
            availableForMobileClient = false
            availableMailActivity = false
        }
    }

    entities(TsProcRole, ['code', 'proc'], UPDATED_BY_WHERE_CONDITION, true) {
        build {
            proc = find(TsProc) { code = EdmPackageReceivingConstants.PROC_CODE }
        }

        simpleEntity {
            name = 'Куратор ЭДО'
            locName = multiLanguageString('Куратор ЭДО', 'EDM curator')
            role = find(TsRole) { name = ThesisConstants.SEC_ROLE_EDM_CURATOR }
            code = EdmPackageReceivingConstants.EDM_CURATOR_ROLE
            sortOrder = 1
        }
        simpleEntity {
            name = 'Подписант'
            locName = multiLanguageString('Подписант', 'Signer')
            role = getRole(ThesisConstants.SEC_ROLE_DOC_APPROVER)
            code = EdmPackageReceivingConstants.SIGNER_ROLE
            sortOrder = 2
        }
        simpleEntity {
            name = 'Секретарь'
            locName = multiLanguageString('Секретарь', 'Secretary')
            role = getRole(ThesisConstants.SEC_ROLE_DOC_SECRETARY)
            code = EdmPackageReceivingConstants.SECRETARY_ROLE
            sortOrder = 3
        }
    }
}

init {
    entities(TsProc, ['jbpmProcessKey'], UPDATED_BY_WHERE_CONDITION, true) {
        simpleEntity {
            name = 'Подготовка документа'
            locName = multiLanguageString('Подготовка документа', 'Document preparation')
            jbpmProcessKey = DocumentPreparationConstants.PROC_CODE
            participantsChangeEnabled = true
            cardTypes = ',df$SimpleDoc,df$Contract,df$AccountDoc,df$Doc,'
            availableForMobileClient = false
            availableEde = true
            availableEdeSessionTypes = '10'
        }
    }

    entities(TsProcRole, ['code', 'proc'], UPDATED_BY_WHERE_CONDITION, true) {
        build {
            proc = getProc(DocumentPreparationConstants.PROC_CODE)
        }

        simpleEntity {
            name = 'Инициатор'
            locName = multiLanguageString('Инициатор', 'Initiator')
            code = DocumentPreparationConstants.PROC_ROLE_INITIATOR
            role = getRole(ThesisConstants.SEC_ROLE_DOC_INITIATOR)
            sortOrder = 1
            edeSessionInitiatorAuthorities = true
        }

        simpleEntity {
            name = 'Редактор'
            locName = multiLanguageString('Редактор', 'Editor')
            orderFillingType = PARALLEL
            multiUser = true
            code = DocumentPreparationConstants.PROC_ROLE_EDITOR
            role = getRole(ThesisConstants.SEC_ROLE_DOC_INITIATOR)
            sortOrder = 2
        }
    }
}

InitDsl.assignCardCreatorDefault(AcquaintanceConstants.PROC_NAME, AcquaintanceConstants.PROC_ROLE_INITIATOR)
InitDsl.assignCardCreatorDefault(RegistrationConstants.PROC_NAME, RegistrationConstants.PROC_ROLE_INITIATOR)
InitDsl.assignCardCreatorDefault(ResolutionConstants.PROC_NAME, ResolutionConstants.PROC_ROLE_INITIATOR)
InitDsl.assignCardCreatorDefault(EndorsementConstants.PROC_NAME, EndorsementConstants.PROC_ROLE_INITIATOR)
InitDsl.assignCardCreatorDefault(ProtocolEndorsementConstants.PROC_NAME, ProtocolEndorsementConstants.PROC_ROLE_INITIATOR)
InitDsl.assignCardCreatorDefault(AgendaEndorsementConstants.PROC_NAME, AgendaEndorsementConstants.PROC_ROLE_INITIATOR)
InitDsl.assignCardCreatorDefault(DocumentPreparationConstants.PROC_CODE, DocumentPreparationConstants.PROC_ROLE_INITIATOR)