accessing
getFromSymbol: aString
	^ self convertableCurrencies detect: [ :each | each symbol = aString ]