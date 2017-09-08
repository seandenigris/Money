accessing
getFromCountryName: aString
	^(convertableCurrencies select:[:each | each country = aString]) first.