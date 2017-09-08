currencies
usDollar
	^ self currencies detect: [ :each | each country = 'UNITED STATES' and: [ each currencyCode = 'USD' ] ]