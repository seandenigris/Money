as yet unclassified
testDivision
	self assert: (3 asMoney: #CAD) / 3 = (1 asMoney: #CAD).
	self should: [3 / (3 asMoney: #CAD)] raise: Error.
	
	self assert: ((3 asMoney: #CAD) + (6 asMoney: #USD)) / 3 = ((1 asMoney: #CAD) + (2 asMoney: #USD))