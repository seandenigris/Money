currencies
usDollar
	^ self currencies detect: [ :each | each numericCode = 840 ]