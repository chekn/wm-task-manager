<p><font color="blue">${BlkIndexUp.blkName}</font>走势强劲。<#list BlkIndexUp.stkUpSuspList as stkUpSusp><font color="blue">${stkUpSusp}</font><#if stkUpSusp_has_next>、</#if></#list>涨停，<#list BlkIndexUp.topStkList as topStk><font color="blue">${topStk}</font>%<#if topStk_has_next>、</#if></#list>。</p>