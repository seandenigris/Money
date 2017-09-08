accessing
countryAndSymbolString
	^ String
		streamContents: [ :s | 
			s
				nextPutAll: self country;
				nextPutAll: ' (';
				nextPutAll: self symbol;
				nextPutAll: ')' ]