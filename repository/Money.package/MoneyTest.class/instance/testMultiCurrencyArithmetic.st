as yet unclassified
testMultiCurrencyArithmetic
	self assert: (12 asMoney: #CAD) + (2 asMoney: #USD) = ((6 asMoney: #CAD) + (1 asMoney: #USD) + (6 asMoney: #CAD) + (1 asMoney: #USD)).
	self assert: (20 asMoney: #CAD) + (5 asMoney: #USD) - (5 asMoney: #CAD) = ((15 asMoney: #CAD) + (5 asMoney: #USD)).
	self assert: (20 asMoney: #CAD) + (5 asMoney: #USD) - (5 asMoney: #USD) = ((20 asMoney: #CAD)).
	self deny: (5 asMoney: #CAD) + (5 asMoney: #USD) = ((5 asMoney: #CAD) + (5 asMoney: #CAD))