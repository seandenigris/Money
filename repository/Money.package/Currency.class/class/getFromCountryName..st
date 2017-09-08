accessing
getFromCountryName: aString
	^ self currencies detect: [ :each | each country asLowercase = aString asLowercase ] ifNone: [ Currency usDollar ]