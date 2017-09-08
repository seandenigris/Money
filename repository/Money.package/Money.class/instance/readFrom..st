reading
readFrom: aStream
	| number thousands curr |
	curr := WriteStream on: String new..
	number := 0.

	"parse the currency"
	['-+0123456789. ' includes: aStream peek] whileFalse: [ curr nextPut: aStream next ].
	curr contents = '' 
		ifTrue: [ currency := Locale current primCurrencySymbol ]
		ifFalse: [ currency := curr contents ].
	
	"parse the number for separators up to the decimal"
	aStream peek = $ ifTrue: [ aStream next ].
	thousands := (aStream contents allButFirst: (aStream position)) subStrings: (Array with: self separator asCharacter)..
	thousands allButLastDo: [ :each | 
		number := (number + each asInteger) * 1000 ].
	number := number asFloat + (thousands last asNumber).
	amount := number