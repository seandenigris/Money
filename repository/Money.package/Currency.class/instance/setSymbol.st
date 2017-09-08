accessing
setSymbol
	symbol := self class currencyCodesAndSymbols at: self currencyCode ifAbsentPut: [String new]