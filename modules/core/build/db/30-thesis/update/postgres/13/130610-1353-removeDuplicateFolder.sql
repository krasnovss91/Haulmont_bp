--$Id$
--Description:

delete from WF_PROC_APP_FOLDER PAF
    using SYS_APP_FOLDER AF, SYS_FOLDER F
    where PAF.FOLDER_ID = AF.FOLDER_ID and AF.FOLDER_ID = F.ID and F.NAME = 'AppFolder_task.ActiveTasksDepartmentChief'^
delete from SYS_APP_FOLDER AF using SYS_FOLDER F
    where AF.FOLDER_ID = F.ID and F.NAME = 'AppFolder_task.ActiveTasksDepartmentChief'^
delete from SYS_FOLDER F where F.NAME = 'AppFolder_task.ActiveTasksDepartmentChief'^