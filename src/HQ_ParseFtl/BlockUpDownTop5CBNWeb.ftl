<p>截至
	<#if BlockUpDownTop5.timeFrame=="noon">
		午间
	<#elseif BlockUpDownTop5.timeFrame=="close">
		全天
	</#if>收盘，
		沪深两市领涨板块
	<#if BlockUpDownTop5.upCount gt 0>
		分别是：
		<#list BlockUpDownTop5.upList as key>
			<#if (key_index<5)>
				${key.blkName}${key.pct}%<#if (key_index!=4 && key_has_next)>、</#if>
			<#else>
				<#break>
			</#if>
		</#list>
	<#else>为零</#if>；
		领跌板块
	<#if BlockUpDownTop5.downCount gt 0>
		分别是：
		<#list BlockUpDownTop5.downList as key>
			<#if (key_index<5)>
				${key.blkName}${key.pct}%<#if (key_index!=4 && key_has_next)>、</#if>
			<#else>
				<#break>
			</#if>
		</#list>
	<#else>为零</#if>。
</p>