as yet unclassified
testSingleCurrencyPrinting
	self assert: (12 asMoney: #CAD) asString = 'CAD 12.00'.
	self assert: (12.2 asMoney: #CAD) asString = 'CAD 12.20'.
	self assert: (1.2323 asMoney: #USD) asString = 'USD 1.23'.
	