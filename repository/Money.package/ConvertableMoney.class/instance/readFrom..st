reading
readFrom: aStream
	| number thousands curr |
	curr := WriteStream on: String new.
	number := 0.
	[ '-+0123456789. ' includes: aStream peek ] whileFalse: [ curr nextPut: aStream next ].
	curr contents = ''
		ifTrue: [ currency := Currency localCurrency ]
		ifFalse: [ currency := Currency getFromSymbol: curr contents ].
	aStream peek = $ 
		ifTrue: [ aStream next ].
	thousands := (aStream contents allButFirst: aStream position) subStrings: (Array with: self separator first).
	thousands allButLastDo: [ :each | number := (number + each asInteger) * 1000 ].
	number := number asFloat + thousands last asNumber.
	amount := number