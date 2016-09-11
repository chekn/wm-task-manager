<#list FirstSusp?keys as key>
${key}${FirstSusp[key]}<#if key_has_next>,</#if>
</#list>