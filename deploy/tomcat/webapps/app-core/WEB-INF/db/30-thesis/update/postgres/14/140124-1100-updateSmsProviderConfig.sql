--$Id$
--$Description : update package for default sms provider class

update SYS_CONFIG set VALUE = 'com.haulmont.thesis.core.app.SmsTrafficProvider'
where NAME = 'workflow.sms.smsProviderClassName' and VALUE = 'com.haulmont.taskman.core.app.SmsTrafficProvider';