updating
setCurrencyCodesAndSymbols
	currencyCodesAndSymbols := Dictionary new.
	self currencyCodesAndUnicodeDecimalsSymbols1 , self currencyCodesAndUnicodeDecimalsSymbols2
		do: [ :eachAssoc | 
			| str |
			str := String new: eachAssoc value size.
			eachAssoc value doWithIndex: [ :each :index | str at: index put: each asCharacter ].
			currencyCodesAndSymbols at: eachAssoc key put: str ]