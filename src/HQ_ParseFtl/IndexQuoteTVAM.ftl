<#if IndexQuote.timeFrame=="am">
<p>上证综指开盘报${IndexQuote.openMap["1A0001_SS"]}；深证成指开盘报${IndexQuote.openMap["2A01_SZ"]}；创业板指开盘报${IndexQuote.openMap["399006_SZ"]}。</p>
</#if>
<#if IndexQuote.timeFrame=="noon">
<p>上证综指早盘收报${IndexQuote.closeMapAm["1A0001_SS"]}；深证成指收报${IndexQuote.closeMapAm["2A01_SZ"]}；创业板指收报${IndexQuote.closeMapAm["399006_SZ"]}。</p>
</#if>