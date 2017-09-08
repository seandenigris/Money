as yet unclassified
printOn: aStream
	self currency ifNotNil: 
		[aStream nextPutAll: self currency.
		aStream space].
	aStream nextPutAll: self amountString