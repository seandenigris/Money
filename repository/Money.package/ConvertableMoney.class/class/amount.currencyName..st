as yet unclassified
amount: aNumber currencyName: aString
	^ self basicNew setAmount: aNumber currency: (Currency getFromName: aString)