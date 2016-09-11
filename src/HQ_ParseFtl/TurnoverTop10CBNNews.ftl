<p>截至
	<#if TurnoverTop10.timeFrame=="noon">
	午间
	<#elseif TurnoverTop10.timeFrame=="close">
	全天
	</#if>
	收盘，沪深两市换手率排名前十名的股票依次为：
	<#list TurnoverTop10.toList as key>
		${key.stkName}换手率${key.toPct}%，
		<#if key.udPct gt 0 >
			上涨${key.udPct}%
		<#elseif key.udPct==0>
			股价与上一交易日持平
		<#elseif key.udPct<0>
			下跌${key.udPct?abs}%
		</#if>
		<#if key_has_next>；</#if>
	</#list>
	。
</p>