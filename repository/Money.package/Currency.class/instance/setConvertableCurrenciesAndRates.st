accessing
setConvertableCurrenciesAndRates

|response first second availableCurrencies convertableCurrencies tmp tmp1 rate|
convertableCurrencies := Dictionary new.
availableCurrencies := Currency Currencies collect: [:each | each currency].

availableCurrencies do: [:each|	response := Curl new getContentsUrl: 'http://www.google.com/search?&q=1.00+USD+in+' , each.
		
	first := response findString: 'h2 class=r' startingAt: 0.
	first=0 ifFalse:[second := response findString: 'h2' startingAt: (first +1).

						tmp1 := response copyFrom: first to: second.
						first := tmp1 findString: '= ' startingAt: 0.
						second := tmp1 findString: ' ' startingAt: (first +2).
						rate := (tmp1 copyFrom: first+2 to: second) asNumber.
						convertableCurrencies at: each put: rate]].




 
Currency ConvertableCurrencies: convertableCurrencies.
Currency CurrenciesUpdated: DateAndTime now.
^convertableCurrencies .
