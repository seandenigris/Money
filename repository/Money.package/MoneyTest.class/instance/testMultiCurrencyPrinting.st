as yet unclassified
testMultiCurrencyPrinting
	self assert: ((12 asMoney: #CAD) + (12.5 asMoney: #USD)) asString = 'USD 12.50, CAD 12.00'