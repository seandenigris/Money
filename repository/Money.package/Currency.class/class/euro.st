currencies
euro
	^ self currencies detect: [ :each | each country = 'EUROPEAN UNION' and: [ each currencyCode = 'EUR' ] ]