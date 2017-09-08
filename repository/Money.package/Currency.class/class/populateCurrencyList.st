accessing
populateCurrencyList
	| currencyXml |
	currencyXml := XMLDOMParser parse: (HTTPSocket httpGetDocument: self currencyListXmlUrl) contents.
	currencies := OrderedCollection new.
	currencyXml firstNode nodes
		do: [ :eachCurrencyXml | 
			| newCurrency |
			newCurrency := self new.
			newCurrency country: eachCurrencyXml nodes first strings first.
			newCurrency currencyName: eachCurrencyXml nodes second strings first.
			newCurrency currency: eachCurrencyXml nodes third strings first.
			newCurrency numericCode: eachCurrencyXml nodes fourth strings first.
			newCurrency minorUnit: eachCurrencyXml nodes fifth strings first.
			newCurrency setSymbol.
			currencies add: newCurrency ]