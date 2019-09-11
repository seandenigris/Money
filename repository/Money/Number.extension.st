Extension { #name : #Number }

{ #category : #'*money' }
Number >> asMoney: currencyString [
	^ Money amount: self currencyCode: currencyString
]

{ #category : #'*money' }
Number >> remainder: aDivisor [
	| negative number | 
	number := self.
	(negative := self < 0) ifTrue: [ number := number * (-1) ].
	number := number - ((number // aDivisor) * aDivisor).
	^negative 
		ifTrue: [ number * (-1) ]
		ifFalse: [ number ]

]
