as yet unclassified
testSingleCurrencyPrinting
	| money |
	money := (12 asMoney: #CAD).
	self assert: money asString = 'CAD 12.00'.
	money := (12.2 asMoney: #CAD).
	self assert: money asString = 'CAD 12.20'.
	money := (1.2323 asMoney: #USD).
	self assert: money asString = 'USD 1.23'.
	