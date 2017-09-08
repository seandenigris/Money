comparing
printOn: aStream
	| n |
	self useSymbol
		ifTrue: [ self currency ifNotNil: [ aStream nextPutAll: currency symbol ] ]
		ifFalse: [ 
			self currency ifNotNil: [ aStream nextPutAll: currency currencyCode ].
			aStream space ].
	self printSeparated: self amount on: aStream