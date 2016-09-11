<#list Chg5MinStkTest['Min5Pct'] as key>
<font color="blue">${key['stkName']}</font>快速<#if key['isUp']>拉升<#else>回落</#if><font color="blue">${key['pct']}</font>%, 报 <font color="blue">${key['price']}</font>元。
</#list>
