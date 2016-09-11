<#if BlockUpDownTop5.timeFrame=="noon">
<p>截至午间收盘，沪深两市领涨板块分别是：<#list BlockUpDownTop5.topUpMap?keys as key>${key}${BlockUpDownTop5.topUpMap[key]}%<#if key_has_next>、</#if></#list>；领跌板块分别是：<#list BlockUpDownTop5.topDownMap?keys as key>${key}${BlockUpDownTop5.topDownMap[key]}%<#if key_has_next>、</#if></#list>。</p>
</#if>