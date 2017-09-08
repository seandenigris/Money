currencies
renminbi
	^ self currencies detect: [ :each | each numericCode = 156 ]