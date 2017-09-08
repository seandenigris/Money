accessing
dollars
	^ ($$ asParser , amount) ==> [ :nodes | 
		Money 
			amount: (nodes second asScaledDecimal: 2) 
			currency: nodes first asString ]