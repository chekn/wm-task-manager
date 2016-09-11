<p>截至
	<#if Amplitude15Pct.timeFrame=="noon">
	午间
	<#elseif Amplitude15Pct.timeFrame=="close">
	全天
	</#if>
	收盘，沪深两市振幅超过15%的股票有：
	<#list Amplitude15Pct.apList as key>
		<#if (key_index<10)>
				${key.stkName}振幅${key.apPct}%，
					<#if key.isUp==1>
						涨${key.udPct}
					<#elseif key.isUp==0>
						股价与上一交易日持平
					<#elseif key.isUp==-1>
						跌${key.udPct}
					</#if>
				<#if (key_index!=10-1 && key_has_next)>；</#if>
		<#else>
			等，共${Amplitude15Pct.apList?size}支个股
			<#break>
		</#if>
	</#list>.
</p>
