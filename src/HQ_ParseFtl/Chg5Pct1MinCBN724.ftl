<#list Chg5Pct1Min.stkList as stkUnit>
${stkUnit.simpleName}快速<#if stkUnit.direction=="up">拉升<#else>下挫</#if>，<#if stkUnit.direction=="up">上涨<#else>下跌</#if>${stkUnit.chgPct}，报${stkUnit.price}元。
</#list>