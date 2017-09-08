as yet unclassified
testCentArithmetic
	self assert: (0.3 asMoney: #CAD) * 3 - (0.9 asMoney: #CAD) = (0 asMoney: #CAD)