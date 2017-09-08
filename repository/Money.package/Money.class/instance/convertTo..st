as yet unclassified
convertTo: aCurrencyCode

|from to rate|

	from := Currency convertableCurrencies at: self currency ifAbsent:[nil].
	to := Currency convertableCurrencies at: aCurrencyCode ifAbsent:[nil].

	from isNil ifTrue: [^self].
	to isNil ifTrue: [^self].	
		
	rate := to/from.

	^Money amount: (rate * self amount) currencyCode: aCurrencyCode .
