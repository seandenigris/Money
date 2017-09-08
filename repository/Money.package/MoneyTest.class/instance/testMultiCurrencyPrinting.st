as yet unclassified
testMultiCurrencyPrinting
	self assert: ((12 asMoney: #CAD) + (12.5 asMoney: #USD)) asString equals: 'CAD 12.00, USD 12.50'