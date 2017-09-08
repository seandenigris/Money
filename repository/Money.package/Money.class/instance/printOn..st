printing
printOn: aStream
	self currency ifNotNil: 
		[aStream nextPutAll: self currency.
		aStream space].
	
	self printSeparated: self amount on: aStream