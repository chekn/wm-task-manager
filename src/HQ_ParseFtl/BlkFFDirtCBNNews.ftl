<p>截至${BlkFFDirt.tradeTime}：</p>
<p>概念板块资金流向</p>
<p></p>
<p>主力资金净买入前五名的板块分别是：<#list BlkFFDirt.concptFFinList?keys as key>${key}${BlkFFDirt.concptFFinList.get(key)}亿<#if key_has_next>、<#else>。</#if></#list></p> 
<p>主力资金净卖出前五名的板块分别是：<#list BlkFFDirt.concptFFoutList?keys as key>${key}${BlkFFDirt.concptFFoutList.get(key)}亿<#if key_has_next>、<#else>。</#if></#list></p>
<p></p>
<p>行业板块资金流向</p>
<p>主力资金净买入前五名的板块分别是：<#list BlkFFDirt.indFFinList?keys as key><#if key_has_next>${key}${BlkFFDirt.indFFinList.get(key)}亿、<#else>。</#if></#list></p> 
<p>主力资金净卖出前五名的板块分别是：<#list BlkFFDirt.indFFoutList?keys as key><#if key_has_next>${key}${BlkFFDirt.indFFoutList.get(key)}亿、<#else>。</#if></#list></p>
