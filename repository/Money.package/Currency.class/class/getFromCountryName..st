accessing
getFromCountryName: aString
	^ self currencies detect: [ :each | each country = aString ] ifNone:[nil]