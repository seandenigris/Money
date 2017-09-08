reading
readFrom: aStream
	^MoneyParser new parse: aStream onError: [ Error signal: 'invalid Money input']
	
	"| number thousands curr currencies |
	currencies := Locale knownLocales values collect: [ :loc | loc primCurrencySymbol ].
	curr := WriteStream on: String new..
	number := 0.

	['-+0123456789. ' includes: aStream peek] whileFalse: [ curr nextPut: aStream next ].
	
	curr contents = '' 
		ifTrue: [ currency := Locale current primCurrencySymbol ]
		ifFalse: [ (currencies anySatisfy: [ :each | curr contents matches: each])
			ifFalse: [ Error signal: 'Invalid Money argument']
			ifTrue: [ currency := curr contents ] ].
	
	aStream peek = $ ifTrue: [ aStream next ].
	thousands := (aStream contents allButFirst: (aStream position)) subStrings: (Array with: self separator first).
	thousands allButLastDo: [ :each | 
		number := (number + each asInteger) * 1000 ].
	number := number asFloat + (thousands last asNumber).
	amount := number"