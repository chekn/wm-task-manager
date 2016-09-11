<p>
	香港股市
	<#if HKIndexQuote.timeFrame=="am">
		开盘
	<#elseif HKIndexQuote.timeFrame=="none">
		上午收盘
	<#elseif HKIndexQuote.timeFrame=="close">
		全日收盘
	</#if>，
		<#list HKIndexQuote.hkList as key>
			<#if key.ifName=="恒生指数">
				恒生指数
			<#elseif key.ifName=="国企指数">
				国企指数
			<#elseif key.ifName="红筹指数">
				红筹指数
			</#if>
				<#if HKIndexQuote.timeFrame!="am">收</#if>
				报
			${key.dotCount}
			点，
			<#if key.udPct gt 0 >
				上涨${key.udPct?abs}%
			<#elseif key.udPct==0 >
				与前一交易日持平
			<#elseif key.udPct<0 >
				下跌${key.udPct?abs}%
			</#if>
			<#if key_has_next>；</#if>
		</#list>。
</p>