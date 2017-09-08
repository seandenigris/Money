accessing
populateCurrencyList
	| currencyXml |
	currencyXml := XMLDOMParser parse: (ZnEasy get: self currencyListXmlUrl) contents.
	currencies := OrderedCollection new.
	currencyXml firstNode nodes first nodes
		do: [ :eachCurrencyXml | 
			| newCurrency nodes |
			nodes := eachCurrencyXml nodes.
			newCurrency := self new.
			self
				storeValueOfElement: 'CtryNm'
				from: nodes
				inInstVar: #country:
				of: newCurrency.
			self
				storeValueOfElement: 'CcyNm'
				from: nodes
				inInstVar: #currencyName:
				of: newCurrency.
			self
				storeValueOfElement: 'Ccy'
				from: nodes
				inInstVar: #currency:
				of: newCurrency.
			self
				storeValueOfElement: 'CcyMnrUnts'
				from: nodes
				inInstVar: #minorUnit:
				of: newCurrency.
			self
				storeValueOfElement: 'CcyNbr'
				from: nodes
				inInstVar: #numericCode:
				of: newCurrency.
			newCurrency setSymbol.
			currencies add: newCurrency ]