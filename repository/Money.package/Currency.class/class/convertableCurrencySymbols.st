accessing
convertableCurrencySymbols
	^ self convertableCurrencies collect: [ :cur | cur symbol ]