update DF_NUMERATOR set SCRIPT =
'def un = com.haulmont.cuba.core.Locator.lookup("cuba_UniqueNumbers")
    String numPrefix = ""
    if(binding.variables.containsKey("docOfficeData")) {
    com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
    if (officeFile && officeFile.getNomenclature().getIndex() != null &&       officeFile.getNomenclature().getIndex() != "") {
       numPrefix = officeFile.getNomenclature().getIndex() + "-"
    }
    }
    return numPrefix +String.valueOf( un.getNextNumber("edminbound")).padLeft(5, "0")' where ID = '50055f2ae04a45f38773f9538a8d5200'^