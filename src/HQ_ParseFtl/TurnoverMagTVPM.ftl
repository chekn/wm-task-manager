<#if TurnoverMag['isPm']>pm:截至${TurnoverMag['hsData']['time']}左右，${TurnoverMag['hsData']['tiketShortName']}换手率已达${TurnoverMag['hsData']['changeRate']+'%'}，较最近20个交易日日均换手率放大5倍以上。该股现报${TurnoverMag['hsData']['priceNow']}元，<#if TurnoverMag['hsData']['isUp']>上涨<#else>下跌</#if>${TurnoverMag['hsData']['upOrDownVal']+'%'}。</#if>