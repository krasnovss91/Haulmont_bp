

const menus = new Map();
menus.set('features',featuresMenu);
menus.set('task', taskMenu);
menus.set('doc', docMenu);
menus.set('contracts',contractsMenu);
menus.set('meetings',meetingsMenu);
menus.set('chancellery',chancelleryMenu);

const articles = new Map();

// try{
articles.set('cardcomment', cardComment);
articles.set('comments', comments);
articles.set('contractsadditional', contractsAdditional);
articles.set('contractsattachments', contractsAttachments);
articles.set('contractsdetails', contractsDetails);
articles.set('docattachments', docAttachments);
articles.set('docsadditional', docsAdditional);
articles.set('docsdetails', docsDetails);
articles.set('heirarhy', heirarhy);
articles.set('meetingsadditional', meetingsAdditional);
articles.set('meetingsattachments', meetingsAttachments);
articles.set('meetingscarddetails', meetingsCardDetails);
articles.set('office', office);
articles.set('solutions', solutions);
articles.set('taskdetails', taskDetails);
articles.set('tasksadditionally', tasksAdditionally);
articles.set('tasksattachments', tasksAttachments);
articles.set('archive', archive);
articles.set('archivistaction', archivistAction);
articles.set('barcode', barcode);
articles.set('basicactions', basicActions);
articles.set('chactivitylog', chActivityLog);
articles.set('chcardcomment', chCardComment);
articles.set('chendorosementlist', chEndorosementList);
articles.set('chprintforms', chPrintForms);
articles.set('dispatchmethods', dispatchMethods);
articles.set('docimentjournals', docimentJournals);
articles.set('envelope', envelope);
articles.set('envelopea4', envelopeA4);
articles.set('fastregistrationform', fastRegistrationForm);
articles.set('fileregister', fileRegister);
articles.set('files', files);
articles.set('generalinformation', generalInformation);
articles.set('mainscreen', mainScreen);
articles.set('officereference', officeReference);
articles.set('printletter', printLetter);
articles.set('registration', registration);
articles.set('reregistration', reRegistration);
articles.set('secretaryactions', secretaryActions);
articles.set('secretaryworkplace', secretaryWorkplace);
articles.set('streamprocessingincoming', streamProcessingIncoming);
articles.set('contractsactivitylog', contractsActivityLog);
articles.set('contractsapproval', contractsApproval);
articles.set('contractsapprovalprocessactions', contractsApprovalProcessActions);
articles.set('contractsapprovalprocessandroles', contractsApprovalProcessAndRoles);
articles.set('contractsapprovalprocessroute', contractsApprovalProcessRoute);
articles.set('contractscard', contractsCard);
articles.set('contractscardcomment', contractsCardComment);
articles.set('contractsendorosementlist', contractsEndorosementList);
articles.set('contractskindandways', contractsKindAndWays);
articles.set('contractsmainscreenwork', contractsMainScreenWork);
articles.set('contractsprintforms', contractsPrintForms);
articles.set('contractsreview', contractsReview);
articles.set('contractsreviewlprocessandroles', contractsReviewlProcessAndRoles);
articles.set('contractsreviewprocessactions', contractsReviewProcessActions);
articles.set('contractsreviewprocessroute', contractsReviewProcessRoute);
articles.set('contractssearchfolders', contractsSearchFolders);
articles.set('contractstemplates', contractsTemplates);
articles.set('contractsways', contractsWays);
articles.set('modelcontract', modelContract);
articles.set('mycontracts', myContracts);
articles.set('docsactivitylog', docsActivityLog);
articles.set('docsapproval', docsApproval);
articles.set('docsapprovalprocessactions', docsApprovalProcessActions);
articles.set('docsapprovalprocessandroles', docsApprovalProcessAndRoles);
articles.set('docsapprovalprocessroute', docsApprovalProcessRoute);
articles.set('docscard', docsCard);
articles.set('docscardcomment', docsCardComment);
articles.set('docsearchfolders', docSearchFolders);
articles.set('docsendorosementlist', docsEndorosementList);
articles.set('docskindandways', docsKindAndWays);
articles.set('docsmainscreenwork', docsMainScreenWork);
articles.set('docsprintforms', docsPrintForms);
articles.set('docsregistration', docsRegistration);
articles.set('docsregistrationprocessactions', docsRegistrationProcessActions);
articles.set('docsregistrationprocessandroles', docsRegistrationProcessAndRoles);
articles.set('docsregistrationprocessroute', docsRegistrationProcessRoute);
articles.set('docsresolution', docsResolution);
articles.set('docsresolutionprocessactions', docsResolutionProcessActions);
articles.set('docsresolutionprocessandroles', docsResolutionProcessAndRoles);
articles.set('docsresolutionprocessroute', docsResolutionProcessRoute);
articles.set('docsreview', docsReview);
articles.set('docsreviewlprocessandroles', docsReviewlProcessAndRoles);
articles.set('docsreviewprocessactions', docsReviewProcessActions);
articles.set('docsreviewprocessroute', docsReviewProcessRoute);
articles.set('docstemplates', docsTemplates);
articles.set('docsways', docsWays);
articles.set('mydocuments', myDocuments);
articles.set('about', about);
articles.set('applicationlog', applicationLog);
articles.set('bankandcurrencies', bankAndCurrencies);
articles.set('calendar', calendar);
articles.set('contractors', contractors);
articles.set('enablenotifications', enableNotifications);
articles.set('feedback', feedback);
articles.set('filtration', filtration);
articles.set('generalmainscreen', generalMainScreen);
articles.set('generalreference', generalReference);
articles.set('help', help);
articles.set('history', history);
articles.set('hotkeys', hotkeys);
articles.set('instruction', instruction);
articles.set('lists', lists);
articles.set('notificationactions', notificationActions);
articles.set('notificationoptions', notificationOptions);
articles.set('notifications', notifications);
articles.set('ourorganization', ourOrganization);
articles.set('referencedata', referenceData);
articles.set('reports', reports);
articles.set('settings', settings);
articles.set('simultaneouscardediting', simultaneousCardEditing);
articles.set('start', start);
articles.set('synchronization', synchronization);
articles.set('usuandcustomizatoin', usuAndCustomizatoin);
articles.set('workwithlists', workWithLists);
articles.set('meetingsactivitylog', meetingsActivityLog);
articles.set('meetingscard', meetingsCard);
articles.set('meetingscardcomment', meetingsCardComment);
articles.set('meetingsendorosementlist', meetingsEndorosementList);
articles.set('meetingskindandways', meetingsKindAndWays);
articles.set('meetingsmainscreenwork', meetingsMainScreenWork);
articles.set('meetingsmetingprotocol', meetingsMetingProtocol);
articles.set('meetingsprintforms', meetingsPrintForms);
articles.set('meetingsprotocolexecution', meetingsProtocolExecution);
articles.set('meetingsreviewagenda', meetingsReviewAgenda);
articles.set('meetingsreviewagendaprocessactions', meetingsReviewAgendaProcessActions);
articles.set('meetingsreviewagendaprocessandroles', meetingsReviewAgendaProcessAndRoles);
articles.set('meetingsreviewagendaprocessroute', meetingsReviewAgendaProcessRoute);
articles.set('meetingsreviewprotocol', meetingsReviewProtocol);
articles.set('meetingsreviewprotocolprocessactions', meetingsReviewProtocolProcessActions);
articles.set('meetingsreviewprotocolprocessandroles', meetingsReviewProtocolProcessAndRoles);
articles.set('meetingsreviewprotocolprocessroute', meetingsReviewProtocolProcessRoute);
articles.set('meetingstemplates', meetingsTemplates);
articles.set('meetingsways', meetingsWays);
articles.set('activitylog', activityLog);
articles.set('executivedisciplinecontrol', executiveDisciplineControl);
articles.set('ganttchart', ganttChart);
articles.set('mytasks', myTasks);
articles.set('printforms', printForms);
articles.set('processactions', processActions);
articles.set('processandroles', processAndRoles);
articles.set('processroute', processRoute);
articles.set('scheduledtask', scheduledTask);
articles.set('searchfolders', searchFolders);
articles.set('task', task);
articles.set('taskcard', taskCard);
articles.set('taskgroup', taskGroup);
articles.set('taskkind', taskKind);
articles.set('taskmainscreenwork', taskMainScreenWork);
articles.set('taskmanagementprocess', taskManagementProcess);
articles.set('taskreport', taskReport);
articles.set('taskways', taskWays);
articles.set('templates', templates);
articles.set('ways', ways);

// }catch(e){

// functionToHandleError(e);
// e.stack;
// }

const initialArticles =  new Map();
// try{
initialArticles.set('features',start)
//initialArticles.white-space: nowrapset('doc',docEndorsment)
initialArticles.set('task', taskMainScreenWork)
initialArticles.set('doc', docsMainScreenWork)
initialArticles.set('contracts', contractsMainScreenWork)
initialArticles.set('meetings', meetingsMainScreenWork)
initialArticles.set('chancellery', mainScreen)
// }catch (e) {
//    log(e);
// }

getLinkTab();
back();
getLink();
changeMenu();
changeArticle();
changeTab();
