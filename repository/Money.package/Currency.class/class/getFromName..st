accessing
getFromName: aString
	^(convertableCurrencies select:[:each | each currencyName = aString]) first.