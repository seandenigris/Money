as yet unclassified
currencies
	currencies isNil ifTrue:[ self initializeCurrencies ].
	^currencies 