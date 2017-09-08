accessing
setConvertableCurrencies

|response first aMoney availableCurrencies convertableCurrencies tmp|
aMoney := Money amount: 1 currency: 'USD'.
availableCurrencies := Currency Currencies collect: [:each | each currency].

tmp := availableCurrencies collect: [:each|	response := Curl new getContentsUrl: 'http://www.google.com/search?&q=1.00+' , aMoney currency , '+in+' , each.
	first := response findString: 'h2 class=r' startingAt: 0.
	first=0 ifFalse:[each]].
convertableCurrencies := tmp select: [:each | each notNil ] .
Currency ConvertableCurrencies: convertableCurrencies .
^convertableCurrencies.