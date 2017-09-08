accessing
getFromCountryName: aString
	^ self convertableCurrencies detect: [ :each | each country = aString ]