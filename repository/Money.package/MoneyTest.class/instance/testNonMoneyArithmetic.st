as yet unclassified
testNonMoneyArithmetic
	self should: [(12 asMoney: #CAD) + 10] raise: Error.
	self should: [10 + (12 asMoney: #CAD)] raise: Error