<p>
<#if IFQuote.timeFrame=="am">
<#elseif IFQuote.timeFrame=="none">
截至上午收盘，
<#elseif IFQuote.timeFrame=="close">
截至全天收盘，
</#if>
	股指期货
	<#list IFQuote.ifList as key>
		${key.ifCode?split(".")[0]}
		<#if IFQuote.timeFrame=="am">开盘<#else>收</#if>
		报${key.dotCount}点，
		<#if key.udPct gt 0>
			上涨${key.udDotCount}点，涨幅${key.udPct}%
		<#elseif key.udPct==0>
			与前一交易日持平
		<#elseif key.udPct<0 >
			下跌${key.udDotCount}点，跌幅${key.udPct?abs}%
		</#if>
		<#if IFQuote.timeFrame!="am">
			，成交额${key.bBalance}亿元，成交量${key.bAmt}手，持仓量${key.amount}手
		</#if>
		<#if key_has_next>；<#else>。</#if>
	</#list>
</p>