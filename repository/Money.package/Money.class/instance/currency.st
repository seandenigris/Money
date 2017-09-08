accessing
currency
	^ currency ifNil: [ currency := Locale current primCurrencySymbol ]