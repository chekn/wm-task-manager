<#if TurnoverTop10.timeFrame=="close">
<p>截至全天收盘，沪深两市换手率排名前十名的股票依次为：<#list TurnoverTop10.turnOverStrList as TurnoverStr><font color="blue">${TurnoverStr}</font></#list></p>
</#if>
