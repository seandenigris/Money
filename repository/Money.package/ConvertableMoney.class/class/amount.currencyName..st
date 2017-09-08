as yet unclassified
amount: aNumber currencyName: aString
	^ self basicNew setAmount: aNumber currency: (Currency convertableCurrencies select:[:each | each currencyName = aString] )first