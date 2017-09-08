updating
setCurrencyCodesAndSymbols
	currencyCodesAndSymbols := Dictionary new.
	self currencyCodesAndSymbolsAtoM , self currencyCodesAndSymbolsNToZ
		do: [ :eachAssoc | currencyCodesAndSymbols at: eachAssoc key put: eachAssoc value ]