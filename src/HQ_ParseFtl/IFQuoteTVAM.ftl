<#if IFQuote.timeFrame=="am">
<p>
股指期货<#list IFQuote.openMap ? keys as key>${key}开盘报${IFQuote.openMap[key]}<#if key_has_next>;</#if></#list>
</p>
</#if>
<#if IFQuote.timeFrame=="noon">
<p>
股指期货<#list IFQuote.closeMapAm ? keys as key>${key}开盘报${IFQuote.closeMapAm[key]}<#if key_has_next>;</#if></#list>
</p>
</#if>
<#if IFQuote.timeFrame=="close">
<p>
股指期货<#list IFQuote.closeMapPm ? keys as key>${key}开盘报${IFQuote.closeMapPm[key]}<#if key_has_next>;</#if></#list>
</p>
</#if>