
<#assign contentVariable=BlkRankFloat.contentVariable />
<#list contentVariable?keys as key>
	
	<#list contentVariable[key] as topBrf>
		<#assign cnData=topBrf.dataTimestamp?number_to_datetime />
		<mediaDraft>
			<mediaTitle>
				${cnData?string("M")}月${cnData?string("d")}日${cnData?string("HH")}:${cnData?string("mm")} 
				恒生${topBrf.blkName}板块
				<#if topBrf.prevAscDescBlkRank gt 0>涨幅<#else>跌幅</#if>
				排名
				<#if topBrf.isRankUp>上升<#else>下降</#if>
				${topBrf.rankDiff}位
			</mediaTitle>
			
			<mediaBody>
				<p>
					${cnData?string("HH")}:${cnData?string("mm")}:${cnData?string("ss")} 
					恒生${topBrf.blkName}板块快速
					<#if topBrf.udPct5Min gt 0>
						拉升
					<#else>
						下跌
					</#if>
					${topBrf.udPct5Min?abs}个百分点，报${topBrf.lastPx}点，
					板块排名从
					<#if topBrf.prevAscDescBlkRank gt 0>涨幅<#else>跌幅</#if>
					${topBrf.prevAscDescBlkRank?abs}位
					<#if topBrf.isRankUp>
						升
					<#else>
						跌
					</#if>
					至
					<#if topBrf.currAscDescBlkRank gt 0>涨幅<#else>跌幅</#if>
					第${topBrf.currAscDescBlkRank?abs}位。
					<#if topBrf.stkInfos?size gt 0>
						行业内
						<#list topBrf.stkInfos as stkInfo>
							${stkInfo.stkName}（${stkInfo.stkCode}）
							<#if topBrf.isRankUp>上涨<#else>下跌</#if>
							${stkInfo.upPct?abs}%
							<#if stkInfo_has_next>;</#if>
						</#list>
						。
					</#if>
				</p>
			</mediaBody>
		</mediaDraft>
	</#list>
	
</#list>