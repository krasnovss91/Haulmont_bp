--Ограниченный доступ + все документы
update SEC_CONSTRAINT set WHERE_CLAUSE = replace(WHERE_CLAUSE,
 '(:session$simpleDocEffectiveClass, :session$accountDocEffectiveClass)', '(:session$simpleDocEffectiveClass, :session$accountDocEffectiveClass, :session$packageDocEffectiveClass)')
 where ENTITY_NAME = 'df$Doc' and GROUP_ID = 'b3dc60f5-65b2-47ab-8802-9e8929bf8b29'^