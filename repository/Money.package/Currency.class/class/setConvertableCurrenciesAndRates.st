updating
setConvertableCurrenciesAndRates
	| rates first second tmp tmp1rates rate arg argDict |
	rates := (JSJsonParser
		parse:
			(HTTPSocket httpGetDocument: 'https://raw.github.com/currencybot/open-exchange-rates/master/latest.json') contents)
		at: 'rates'.
	self currencies do: [ :each | each conversionRateToUSD: (rates at: each currency ifAbsentPut: [ 0 ]) ].
	self convertableCurrencies: (currencies select: [ :each | each isConvertable ]) asSet asSortedCollection.
	self currenciesUpdated: DateAndTime now