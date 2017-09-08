accessing
setConvertableCurrenciesAndRates
	| response first second tmp tmp1 rate arg |
	convertableCurrencies := Dictionary new.
	currencies 
		do:
			[ :each | 
			arg := Array with: '1USD=?' , each currency.
			response := HTTPSocket
				httpGetDocument: 'http://www.google.com/ig/calculator'
				args:
					{'hl' -> #('en').
					'q' -> arg}.
			first := response contents findString: ',rhs' startingAt: 0.
			second := response contents findString: ' ' startingAt: first + 7.
			rate := (response contents copyFrom: first + 7 to: second).
			rate = '",error: ' ifTrue:[] ifFalse:[rate:=rate copy asNumber.
		
			each conversionRateToUSD: rate ]].
	self convertableCurrencies: (currencies select:[:each | each isConvertable]).
	self currenciesUpdated: DateAndTime now.
