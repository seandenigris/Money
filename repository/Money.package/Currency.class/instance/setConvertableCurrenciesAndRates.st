accessing
setConvertableCurrenciesAndRates
	| response first second availableCurrencies convertableCurrencies tmp tmp1 rate arg |
	convertableCurrencies := Dictionary new.
	availableCurrencies := (Currency currencies collect: [ :each | each currency ]) asSet.
	availableCurrencies
		do:
			[ :each | 
			arg := Array with: '1USD=?' , each.
			response := HTTPSocket
				httpGetDocument: 'http://www.google.com/ig/calculator'
				args:
					{'hl' -> #('en').
					'q' -> arg}.
			first := response contents findString: ',rhs' startingAt: 0.
			second := response contents findString: ' ' startingAt: first + 7.
			rate := (response contents copyFrom: first + 7 to: second) asNumber.
		
			convertableCurrencies at: each put: rate ].
	Currency convertableCurrencies: convertableCurrencies.
	Currency currenciesUpdated: DateAndTime now.
	self setConvertableCurrencyNames