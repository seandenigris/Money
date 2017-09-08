as yet unclassified
testSameCurrencyArithmetic
	self assert: (12 asMoney: #CAD) + (10 asMoney: #CAD) = (22 asMoney: #CAD).
	self assert: (20 asMoney: #CAD) - (5 asMoney: #CAD) = (15 asMoney: #CAD).
	self assert: (3 asMoney: #CAD) * 4 = (12 asMoney: #CAD).
	self assert: 5 * (2 asMoney: #CAD) = (10 asMoney: #CAD).