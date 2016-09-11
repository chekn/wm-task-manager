<#list Chg5Pct1Min.stkList as stkUnit>
<font color="blue">${stkUnit.simpleName}</font>快速<#if stkUnit.direction=="up">拉升<#else>下挫</#if>，<#if stkUnit.direction=="up">上涨<#else>下跌</#if><font color="blue">${stkUnit.chgPct}</font>，报<font color="blue">${stkUnit.price}</font>元。
</#list>
