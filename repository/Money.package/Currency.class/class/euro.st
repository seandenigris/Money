currencies
euro
	^ self currencies detect: [ :each | each numericCode = 978 ]