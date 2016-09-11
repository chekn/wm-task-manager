<#if IFQuote.timeFrame!="am">
	<p>
	<#if IFQuote.timeFrame=="none">
	截至上午收盘，
	<#elseif IFQuote.timeFrame=="close">
	截至全天收盘，
	</#if>
		股指期货${IFQuote.ifStatus},
		<#list IFQuote.ifList as key>
			<#if key.ifCode?contains("IF")>
				沪深300期指主力合约
			<#elseif key.ifCode?contains("IH")>
				上证50期指主力合约
			<#elseif key.ifCode?contains("IC")>
				中证500期指主力合约
			</#if>
			${key.ifCode?split(".")[0]}
			收报${key.dotCount}点，
			<#if key.udPct gt 0>
				上涨${key.udDotCount}点，涨幅${key.udPct}%
			<#elseif key.udPct==0>
				与前一交易日持平
			<#elseif key.udPct<0 >
				下跌${key.udDotCount}点，跌幅${key.udPct?abs}%
			</#if>，成交额${key.bBalance}亿元，成交量${key.bAmt}手，持仓量${key.amount}手
			<#if key_has_next>；<#else>。</#if>
		</#list>
	</p>
</#if>