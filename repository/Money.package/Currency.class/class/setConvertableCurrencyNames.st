accessing
setConvertableCurrencyNames
	Currency
		convertableCurrencyNames:
			(Currency convertableCurrencies
				collect: [ :each | each currencyName ]) asSet asSortedCollection