currencies
swissFranc
	^ self currencies detect: [ :each | each country = 'SWITZERLAND' and: [ each currencyCode = 'CHF' ] ]