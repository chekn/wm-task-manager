<#if HKIndexQuote.timeFrame=="am">
<p>香港股市开盘，恒生指数报${HKIndexQuote.openMap["HSI_HKI"]}；国企指数报${HKIndexQuote.openMap["HZ5014_HKI"]}；红筹指数报${HKIndexQuote.openMap["HZ5015_HKI"]}。</p>
</#if>
<#if HKIndexQuote.timeFrame=="noon">
<p>香港股市上午收盘，恒生指数报${HKIndexQuote.closeMapAm["HSI_HKI"]}；国企指数报${HKIndexQuote.closeMapAm["HZ5014_HKI"]}；红筹指数报${HKIndexQuote.closeMapAm["HZ5015_HKI"]}。</p>
</#if>