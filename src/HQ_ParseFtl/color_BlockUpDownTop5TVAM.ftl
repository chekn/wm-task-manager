<#if BlockUpDownTop5.timeFrame=="noon">
<p>截至午间收盘，沪深两市领涨板块分别是：<#list BlockUpDownTop5.topUpMap?keys as key><font color="blue"><font color="blue">${key}</font></font><font color="blue">${BlockUpDownTop5.topUpMap[key]}</font>%<#if key_has_next>、</#if></#list>；领跌板块分别是：<#list BlockUpDownTop5.topDownMap?keys as key><font color="blue"><font color="blue">${key}</font></font><font color="blue">${BlockUpDownTop5.topDownMap[key]}</font>%<#if key_has_next>、</#if></#list>。</p>
</#if>
