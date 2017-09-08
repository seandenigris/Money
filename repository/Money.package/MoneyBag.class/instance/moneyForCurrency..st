as yet unclassified
moneyForCurrency: aString
	^ byCurrency at: aString ifAbsent: [Money amount: 0 currency: aString]