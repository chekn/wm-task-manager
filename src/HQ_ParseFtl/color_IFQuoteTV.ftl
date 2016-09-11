<#if IFQuote.timeFrame!="am"><p><#if IFQuote.timeFrame=="none">截至上午收盘，<#elseif IFQuote.timeFrame=="close">截至全天收盘，</#if>股指期货<font color="blue">${IFQuote.ifStatus}</font>,<#list IFQuote.ifList as key><#if key.ifCode?contains("IF")>沪深300期指主力合约<#elseif key.ifCode?contains("IH")>上证50期指主力合约<#elseif key.ifCode?contains("IC")>中证500期指主力合约</#if><font color="blue">${key.ifCode?split(".")[0]}</font>收报<font color="blue">${key.dotCount}</font>点，<#if key.udPct gt 0>上涨<font color="blue">${key.udDotCount}</font>点，涨幅<font color="blue">${key.udPct}</font>%<#elseif key.udPct==0>与前一交易日持平<#elseif key.udPct<0 >下跌<font color="blue">${key.udDotCount}</font>点，跌幅<font color="blue">${key.udPct?abs}</font>%</#if>，成交额<font color="blue">${key.bBalance}</font>亿元，成交量<font color="blue">${key.bAmt}</font>手，持仓量<font color="blue">${key.amount}</font>手<#if key_has_next>；<#else>。</#if></#list></p></#if>