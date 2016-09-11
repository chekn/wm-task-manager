<#list Break100['SzBreak100'] as key >
<p>上证指数<#if key['isUp']>突破<#else>跌破</#if><font color="blue">${ key['price'] }</font>，<#if key['isUp']>涨<#else>跌</#if>幅扩大至<font color="blue">${key['chgPct']+'%'}</font>。      
</#list>
