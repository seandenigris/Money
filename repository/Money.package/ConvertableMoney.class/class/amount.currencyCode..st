as yet unclassified
amount: aNumber currencyCode: aString
	^ self basicNew setAmount: aNumber currency: (Currency convertableCurrencies select:[:each | each currency = aString] )first