accessing
populateCurrencyList
	| currencyXml |
	[ currencyXml := XMLDOMParser parse: (self httpClient get: self currencyListXmlUrl) contents ]
		on: NameLookupFailure
		do: [ 
			Transcript show: 'no network connection'.
			^ self ].
	currencies := OrderedCollection new.
	
		(currencyXml  findElementNamed: 'CcyTbl') nodes 
			select:[:ea | ea isStringNode not] 
			thenDo:
		 [ :eachCurrencyXml | 
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