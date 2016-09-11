<#list HKIndexBreak1000['hkBreak1000'] as key>
<p>香港恒生指数<#if key['isUp']>上穿<#else>下穿</#if>${key['poi']}关口,报${key['price']}点，<#if key['isUp']>涨<#else>跌</#if>幅为${key['chgPct']+'%'}。
</#list>      