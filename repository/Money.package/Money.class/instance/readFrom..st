as yet unclassified
readFrom: aStream
	| number stream |
	
	number := 0.
	('-+0123456789.' includes: aStream peek) ifFalse: [ currency := aStream next asString ].
	stream := ReadStream on: (aStream upTo: $.).
	[ stream atEnd ] whileFalse: [
		number := number + ((stream upTo: $,) asInteger).
		stream atEnd ifFalse: [ number := number * 1000 ]].
	number := number asFloat + ((Float readFrom: aStream) / 100).
	amount := number