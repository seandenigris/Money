*money-currency
convertFrom: aMoney to: aCurrencyCode

|from to rate|
((Currency CurrenciesUpdated + self currencyRefreshPeriod) < DateAndTime now) ifTrue:[Currency new setConvertableCurrenciesAndRates.] 

ifFalse:[
	from := Currency ConvertableCurrencies at: aMoney currency ifAbsent:[false].
	to := Currency ConvertableCurrencies at: aCurrencyCode ifAbsent:[false].

	from ifFalse: [^aMoney].
	to ifFalse: [^aMoney].	
		
	rate := to/from.

	^Money amount: (rate * aMoney amount) currencyCode: aCurrencyCode ].
