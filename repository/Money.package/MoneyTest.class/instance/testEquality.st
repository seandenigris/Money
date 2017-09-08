as yet unclassified
testEquality
	self assert: (12 asMoney: #CAD) = (12 asMoney: #CAD).
	self deny: (12 asMoney: #CAD) = (10 asMoney: #CAD).
	self deny: (12 asMoney: #CAD) = (12 asMoney: #USD)