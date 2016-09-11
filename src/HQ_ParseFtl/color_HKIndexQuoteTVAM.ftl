<#if HKIndexQuote.timeFrame=="am">
<p>香港股市开盘，恒生指数报<font color="blue">${HKIndexQuote.openMap["HSI_HKI"]}</font>；国企指数报<font color="blue">${HKIndexQuote.openMap["HZ5014_HKI"]}</font>；红筹指数报<font color="blue">${HKIndexQuote.openMap["HZ5015_HKI"]}</font>。</p>
</#if>
<#if HKIndexQuote.timeFrame=="noon">
<p>香港股市上午收盘，恒生指数报<font color="blue">${HKIndexQuote.closeMapAm["HSI_HKI"]}</font>；国企指数报<font color="blue">${HKIndexQuote.closeMapAm["HZ5014_HKI"]}</font>；红筹指数报<font color="blue">${HKIndexQuote.closeMapAm["HZ5015_HKI"]}</font>。</p>
</#if>
