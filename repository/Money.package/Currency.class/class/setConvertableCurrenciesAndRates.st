updating
setConvertableCurrenciesAndRates
	| rates first second tmp tmp1rates rate arg argDict |
	rates := (JSJsonParser parse: (HTTPSocket httpGetDocument: 'http://openexchangerates.org/latest.json') contents)
		at: 'rates'.
	self currencies do: [ :each | each conversionRateToUSD: (rates at: each currency ifAbsentPut: [ 0 ]) ].
	self convertableCurrencies: (currencies select: [ :each | each isConvertable ]) asSet asSortedCollection.
	self currenciesUpdated: DateAndTime now