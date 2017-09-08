updating
setConvertableCurrenciesAndRates
	| rates first second tmp tmp1rates rate arg argDict |
	rates := (Json readFrom: (self httpClient get: self latestUrl) contents readStream) at: 'rates'.
	self currencies do: [ :each | each conversionRateToUSD: (rates at: each currency ifAbsentPut: [ 0 ]) ].
	self convertableCurrencies: (currencies select: [ :each | each isConvertable ]) asSet asSortedCollection.
	self currenciesUpdated: DateAndTime now