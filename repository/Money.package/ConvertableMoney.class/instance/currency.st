accessing
currency
	^ currency ifNil: [ currency := Currency localCurrency ]