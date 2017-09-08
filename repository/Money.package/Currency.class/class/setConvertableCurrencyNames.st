accessing
setConvertableCurrencyNames
	self
		convertableCurrencyNames:
			(self convertableCurrencies
				collect: [ :each | each currencyName ]) asSet asSortedCollection