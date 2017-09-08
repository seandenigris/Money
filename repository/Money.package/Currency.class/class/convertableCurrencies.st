accessing
convertableCurrencies
	 convertableCurrencies isNil ifTrue:[self setConvertableCurrenciesAndRates  ].
	^convertableCurrencies 