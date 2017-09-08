updating
localCurrency
	self convertableCurrencies detect: [ :each | each symbol = Locale current primCurrencySymbol ]