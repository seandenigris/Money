printing
printSeparated: aNumber on: aStream
	| s n |
	aNumber > 1000
		ifTrue: [ self printSeparated: (aNumber // 1000) on: aStream.
			n :=  (aNumber remainder: 1000).
			s := ( n asString).
			s := (s padded: #left to: 3 with: $0).
			aStream nextPutAll: s ]
		ifFalse: [ aStream nextPutAll: aNumber asString ].
	aStream nextPutAll: self separator