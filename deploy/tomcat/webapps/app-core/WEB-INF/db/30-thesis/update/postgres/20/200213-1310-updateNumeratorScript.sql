update DF_NUMERATOR set SCRIPT = E'import com.haulmont.cuba.core.app.DataService
import com.haulmont.cuba.core.global.LoadContext
import com.haulmont.thesis.core.entity.Doc
import com.haulmont.thesis.core.entity.DocOfficeData
import org.apache.commons.lang.StringUtils
import org.apache.commons.lang.math.NumberUtils

DataService dataService = com.haulmont.cuba.core.Locator.lookup(DataService.NAME);
String numPrefix = "";

if (binding.variables.containsKey("docOfficeData")) {
    com.haulmont.thesis.core.entity.OfficeFile officeFile = ((DocOfficeData) binding.getProperty("docOfficeData")).getOfficeFile();
    if (officeFile && officeFile.getNomenclature().getIndex() != null && officeFile.getNomenclature().getIndex() != "") {
        numPrefix = officeFile.getNomenclature().getIndex() + "-"
    }
}

LoadContext ctx = new LoadContext(Doc.class);
ctx.setQueryString("""select doc1 from df\\$Doc doc1 where doc1.docKind.id=:docKindId
    and doc1.parentCard.id=:parentCardId and doc1.parentCard is not null and doc1.id<>:exclId and doc1.templateName is null and doc1.versionOf is null""");
ctx.getQuery().setParameter("docKindId", binding.getVariable("entity").getDocKind())
    .setParameter("parentCardId", binding.getVariable("entity").getParentCard())
    .setParameter("exclId", binding.getVariable("entity").getId());
List<Doc> docs = dataService.loadList(ctx);

String currentNumberStr = null;
Integer currentNumber = 0;
Integer maxNumber = 0;

for (int i=1; i <= docs.size(); i++) {
    currentNumberStr = docs.get(i-1).getNumber();
    currentNumberStr = currentNumberStr.substring(currentNumberStr.lastIndexOf("-") + 1);

    if (NumberUtils.isDigits(currentNumberStr)) {
        currentNumber = Integer.parseInt(currentNumberStr);
        if (maxNumber < currentNumber) {
            maxNumber = currentNumber;
        }
    }
}
return (numPrefix + (maxNumber + 1)).padLeft(5, "0");'
where CODE = 'Приложение к договору'^

update DF_NUMERATOR set SCRIPT = E'import com.haulmont.cuba.core.app.DataService
import com.haulmont.cuba.core.global.LoadContext
import com.haulmont.thesis.core.entity.Doc
import com.haulmont.thesis.core.entity.DocOfficeData
import org.apache.commons.lang.StringUtils
import org.apache.commons.lang.math.NumberUtils

DataService dataService = com.haulmont.cuba.core.Locator.lookup(DataService.NAME);
String numPrefix = "";

if (binding.variables.containsKey("docOfficeData")) {
    com.haulmont.thesis.core.entity.OfficeFile officeFile = ((DocOfficeData) binding.getProperty("docOfficeData")).getOfficeFile();
    if (officeFile && officeFile.getNomenclature().getIndex() != null && officeFile.getNomenclature().getIndex() != "") {
        numPrefix = officeFile.getNomenclature().getIndex() + "-"
    }
}

LoadContext ctx = new LoadContext(Doc.class);
ctx.setQueryString("""select doc1 from df\\$Doc doc1 where doc1.docKind.id=:docKindId
    and doc1.parentCard.id=:parentCardId and doc1.parentCard is not null and doc1.id<>:exclId and doc1.templateName is null and doc1.versionOf is null""");
ctx.getQuery().setParameter("docKindId", binding.getVariable("entity").getDocKind())
    .setParameter("parentCardId", binding.getVariable("entity").getParentCard())
    .setParameter("exclId", binding.getVariable("entity").getId());
List<Doc> docs = dataService.loadList(ctx);

String currentNumberStr = null;
Integer currentNumber = 0;
Integer maxNumber = 0;

for (int i=1; i <= docs.size(); i++) {
    currentNumberStr = docs.get(i-1).getNumber();
    currentNumberStr = currentNumberStr.substring(currentNumberStr.lastIndexOf("-") + 1);

    if (NumberUtils.isDigits(currentNumberStr)) {
        currentNumber = Integer.parseInt(currentNumberStr);
        if (maxNumber < currentNumber) {
            maxNumber = currentNumber;
        }
    }
}
return (numPrefix + (maxNumber + 1)).padLeft(5, "0");'
where CODE = 'Дополнительное соглашение'^