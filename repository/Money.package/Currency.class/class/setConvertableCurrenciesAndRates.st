accessing
setConvertableCurrenciesAndRates
	| rates first second tmp tmp1rates  rate arg argDict|

	convertableCurrencies := Dictionary new.
	rates:=(JSJsonParser parse: (HTTPSocket httpGetDocument: 'https://raw.github.com/currencybot/open-exchange-rates/master/latest.json' ) contents) at: 'rates'.
	
		currencies 	do:
			[ :each | each conversionRateToUSD: (rates at: each currency ifAbsentPut:[0]) ].
	Currency convertableCurrencies: (currencies select:[:each | each isConvertable]).
	Currency currenciesUpdated: DateAndTime now.
