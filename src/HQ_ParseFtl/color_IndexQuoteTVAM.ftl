<#if IndexQuote.timeFrame=="am">
<p>上证综指开盘报<font color="blue">${IndexQuote.openMap["1A0001_SS"]}</font>；深证成指开盘报<font color="blue">${IndexQuote.openMap["2A01_SZ"]}</font>；创业板指开盘报<font color="blue">${IndexQuote.openMap["399006_SZ"]}</font>。</p>
</#if>
<#if IndexQuote.timeFrame=="noon">
<p>上证综指早盘收报<font color="blue">${IndexQuote.closeMapAm["1A0001_SS"]}</font>；深证成指收报<font color="blue">${IndexQuote.closeMapAm["2A01_SZ"]}</font>；创业板指收报<font color="blue">${IndexQuote.closeMapAm["399006_SZ"]}</font>。</p>
</#if>
