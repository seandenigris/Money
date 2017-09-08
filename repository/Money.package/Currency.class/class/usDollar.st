currencies
usDollar
	^ self currencies
		detect: [ :each | 
			each currencyCode = 'USD'
				and: [ each country = 'UNITED STATES' or: [ each country = 'UNITED STATES OF AMERICA (THE)' ] ] ]