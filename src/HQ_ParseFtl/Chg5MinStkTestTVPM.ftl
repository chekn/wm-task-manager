<#list Chg5MinStkTest['Min5Pct'] as key>
${key['stkName']}快速<#if key['isUp']>拉升<#else>回落</#if>${key['pct']}%, 报 ${key['price']}元。
</#list>