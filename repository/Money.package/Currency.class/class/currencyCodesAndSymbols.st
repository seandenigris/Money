updating
currencyCodesAndSymbols
	currencyCodesAndSymbols isNil
		ifTrue: [ self setCurrencyCodesAndSymbols ].
	^ currencyCodesAndSymbols