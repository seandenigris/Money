as yet unclassified
amount: aNumber countryName: aString
	^ self basicNew setAmount: aNumber currency: (Currency getFromCountryName: aString)