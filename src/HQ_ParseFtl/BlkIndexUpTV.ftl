<#list BlkIndexUp.contentVariable as blkData>
	<p>
		${blkData.blkName}走势强劲，
		<#if blkData.upStopStkNames?size gt 0>
			<#list blkData.upStopStkNames as upStopStkName>
				${upStopStkName}<#if upStopStkName_has_next>、</#if>
			</#list>涨停，
		</#if>
		<#if blkData.upStkInfo??>
			<#assign upStkInfo=blkData.upStkInfo />
			${upStkInfo.blkName}涨${upStkInfo.upPct}%
		</#if>。
	</p>
</#list>