accessing
dollars
	^ (currency , amount) ==> [ :nodes |
		Money 
			amount: (nodes second asScaledDecimal: 2) 
			currency: (nodes first isNil
				ifTrue: [ Locale current primCurrencySymbol asString ]
				ifFalse: [ nodes first asString ]) ]