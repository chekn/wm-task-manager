<p>
<#list IndexQuote.iList as key>
	<#if key.iCode=="1A0001.SS">
		上证综指
	<#elseif key.iCode=="2A01.SZ">
		深证成指
	<#elseif key.iCode=="399006.SZ">
		创业板指
	</#if>
	<#if IndexQuote.timeFrame=="am">开盘<#else>收</#if>
		报${key.dotCount}点,
	<#if key.udPct gt 0>
		上涨${key.udDotCount}点，涨幅${key.udPct}%
	<#elseif key.udPct==0>
		与前一交易日持平
	<#elseif key.udPct<0>
		下跌${key.udDotCount}点，跌幅${key.udPct?abs}%
	</#if>
	<#if IndexQuote.timeFrame!="am">
		，成交额${key.bBalance}亿元
	</#if>
	<#if key_has_next>；</#if>
</#list>。
</p>