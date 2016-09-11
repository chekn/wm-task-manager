<#if Chg5MinStkTest.upCount gt 0>
<p>${Chg5MinStkTest.currHH}:${Chg5MinStkTest.currmm}:${Chg5MinStkTest.currss} 以下股票过去5分钟出现快速拉升：
<#list Chg5MinStkTest.revUpList as key>
${key['stkName']}快速拉升${key['pct']}%，报 ${key['price']}元<#if key_has_next>；<#else>。</#if>
</#list>
</p>
</#if>
<#if Chg5MinStkTest.downCount gt 0>
<p>${Chg5MinStkTest.currHH}:${Chg5MinStkTest.currmm}:${Chg5MinStkTest.currss}以下股票过去5分钟出现快速回落：
<#list Chg5MinStkTest.revDownList as key>
${key['stkName']}快速回落${key['pct']}%，报 ${key['price']}元<#if key_has_next>；<#else>。</#if>
</#list>
</p>
</#if>