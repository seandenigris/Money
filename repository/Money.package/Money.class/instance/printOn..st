printing
printOn: aStream
	| n |
	self currency ifNotNil: 
		[aStream nextPutAll: self currency ].
	aStream space.
	amount > 1000 
		ifTrue: [ self printSeparated: amount // 1000 on: aStream.
			n := amount remainder: 1000.
			aStream nextPutAll: (n integerPart asInteger asString padded: #left to: 3 with: $0).
			aStream nextPutAll: ((n fractionPart printShowingDecimalPlaces: 2) allButFirst: 1) ]
		ifFalse: [ aStream nextPutAll: self amountString ]