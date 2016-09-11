<#list FirstSusp?keys as key>
<font color="blue">${key}</font><font color="blue">${FirstSusp[key]}</font><#if key_has_next>,</#if>
</#list>
