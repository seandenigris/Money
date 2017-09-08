as yet unclassified
convertTo: aCurrencyCode

|from to rate|

	from := Currency convertableCurrencies select:[:each | each currency = self currency]. 
	to := Currency convertableCurrencies select:[:each | each currency = aCurrencyCode]. 

	from isEmptyOrNil ifTrue: [^self].
	to isEmptyOrNil ifTrue: [^self].	
		
	rate := to conversionRateToUSD / from conversionRateToUSD .

	^ConvertableMoney amount: (rate * self amount) currencyCode: aCurrencyCode .
