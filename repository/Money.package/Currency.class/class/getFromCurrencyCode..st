accessing
getFromCurrencyCode: aString
	^ self convertableCurrencies detect: [ :each | each currency = aString ]