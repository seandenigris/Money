accessing
getFromName: aString
	^ self convertableCurrencies detect: [ :each | each currencyName = aString ]