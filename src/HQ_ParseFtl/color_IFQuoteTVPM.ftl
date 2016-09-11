<#if IFQuote.timeFrame=="am">
<p>
股指期货<#list IFQuote.openMap ? keys as key><font color="blue">${key}</font>开盘报<font color="blue">${IFQuote.openMap[key]}</font><#if key_has_next>;</#if></#list>
</p>
</#if>
<#if IFQuote.timeFrame=="noon">
<p>
股指期货<#list IFQuote.closeMapAm ? keys as key><font color="blue">${key}</font>开盘报<font color="blue">${IFQuote.closeMapAm[key]}</font><#if key_has_next>;</#if></#list>
</p>
</#if>
<#if IFQuote.timeFrame=="close">
<p>
股指期货<#list IFQuote.closeMapPm ? keys as key><font color="blue">${key}</font>开盘报<font color="blue">${IFQuote.closeMapPm[key]}</font><#if key_has_next>;</#if></#list>
</p>
</#if>
