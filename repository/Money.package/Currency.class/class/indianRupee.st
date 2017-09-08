currencies
indianRupee
	^ self currencies detect: [ :each | each country = 'INDIA' and: [ each currencyCode = 'INR' ] ]