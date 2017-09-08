printing
printOn: aStream
	
	self useSymbol 
		ifTrue:[self currency isNil ifFalse:[aStream nextPutAll: currency symbol ]]
		ifFalse: [ self currency isNil ifFalse:[ 
									[aStream nextPutAll: currency currencyCode].
									aStream space.]].
	
	self printSeparated: self amount on: aStream