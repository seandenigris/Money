accessing
getFromCurrencyCode: aString
	^(convertableCurrencies select:[:each | each currency = aString]) first.