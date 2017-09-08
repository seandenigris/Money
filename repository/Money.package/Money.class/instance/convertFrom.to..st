as yet unclassified
convertFrom: aMoney to: aCurrencyCode

|from to rate|

	from := Currency convertableCurrencies at: aMoney currency ifAbsent:[nil].
	to := Currency convertableCurrencies at: aCurrencyCode ifAbsent:[nil].

	from isNil ifTrue: [^aMoney].
	to isNil ifTrue: [^aMoney].	
		
	rate := to/from.

	^Money amount: (rate * aMoney amount) currencyCode: aCurrencyCode .
