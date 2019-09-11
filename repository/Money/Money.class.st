Class {
	#name : #Money,
	#superclass : #Magnitude,
	#instVars : [
		'amount',
		'currency'
	],
	#category : 'Money'
}

{ #category : #'as yet unclassified' }
Money class >> amount: aNumber currency: aString [
	^ self basicNew setAmount: aNumber currency: aString
]

{ #category : #'as yet unclassified' }
Money class >> amount: aNumber currencyCode: aString [
	^ self amount: aNumber currency: aString
]

{ #category : #'as yet unclassified' }
Money class >> readFrom: aStream [
	^ self new readFrom: aStream

]

{ #category : #nil }
Money class >> zeroMoney [
	^self amount: 0 currency:'USD'.
]

{ #category : #arithmetic }
Money >> * other [
	other isMoney ifTrue: [self error: 'Cannot multiply two money values'].
	^ self class amount: self amount * other currency: self currency
]

{ #category : #arithmetic }
Money >> + other [
	other = 0 ifTrue: [^ self].
	other isMoney ifFalse: [self errorNotMoney].
	other currency = self currency ifTrue:
		[^ self class amount: self amount + other amount currency: self currency].
	^ MoneyBag new
		add: other;
		add: self;
		yourself
]

{ #category : #arithmetic }
Money >> - other [
	other = 0 ifTrue: [^ self].
	other isMoney ifFalse: [self errorNotMoney].
	other currency = self currency ifTrue:
		[^ self class amount: self amount - other amount currency: self currency].
	^ self + (other * -1)
]

{ #category : #arithmetic }
Money >> / other [
	other isMoney ifTrue: [self error: 'Cannot divide two money values'].
	^ self class amount: self amount / other currency: self currency
]

{ #category : #comparing }
Money >> < other [
	^ self amount < other amount or: [self amount = other amount and: [self currency < other currency]]
]

{ #category : #comparing }
Money >> = other [
	^ other species = self species
		and:[other amount = self amount
		and: [other currency = self currency]]
]

{ #category : #arithmetic }
Money >> \\ other [
	other isMoney ifTrue: [self error: 'Cannot \\ two money values'].
	^ self class amount: self amount \\ other currency: self currency
]

{ #category : #arithmetic }
Money >> acceptMagritte: aVisitor [
	aVisitor visitMoneyDescription: self
]

{ #category : #visiting }
Money >> acceptRoeVisitor: aVisitor [
	aVisitor visitMoney: self
]

{ #category : #arithmetic }
Money >> adaptToNumber: aNumber andSend: aSymbol [
	aSymbol = #/ ifTrue: [self error: 'Cannot divide by money'].
	"most other cases will error nicely, so we don't need to worry about order"
	^ self perform: aSymbol with: aNumber
]

{ #category : #accessing }
Money >> amount [
	^ amount
]

{ #category : #accessing }
Money >> amount: anObject [
	amount := anObject
]

{ #category : #printing }
Money >> amountString [
	^ amount printShowingDecimalPlaces: 2
]

{ #category : #printing }
Money >> asSingleCurrencyValues [
	^ Array with: self
]

{ #category : #accessing }
Money >> currency [
	^ currency ifNil: [ currency := Locale current primCurrencySymbol ]
]

{ #category : #accessing }
Money >> currency: anObject [
	^ currency := anObject
]

{ #category : #accessing }
Money >> decimal [
	^Locale current primDecimalSymbol first
]

{ #category : #comparing }
Money >> errorNotMoney [
	self error: 'Invalid arithmetic operation between money and non-money value'
]

{ #category : #comparing }
Money >> hash [
	^ amount hash bitXor: currency hash
]

{ #category : #testing }
Money >> isMoney [
	^ true
]

{ #category : #testing }
Money >> isNumber [
	^ true
]

{ #category : #testing }
Money >> isSingleCurrency [
	^ true
]

{ #category : #arithmetic }
Money >> nearestCent [
	^ amount roundTo: 0.01
]

{ #category : #arithmetic }
Money >> normalizeAmount: aNumber [

	^ (aNumber * 10000) rounded / 10000
]

{ #category : #printing }
Money >> printOn: aStream [
	self currency ifNotNil: 
		[aStream nextPutAll: self currency.
		aStream space].
	
	self printSeparated: self amount on: aStream
]

{ #category : #printing }
Money >> printSeparated: aNumber on: aStream [
	| s n n1 sz |
	s := aNumber printShowingDecimalPlaces: 2.
	n := s copyUpTo: self decimal.
	
	[ n size > 0 ] whileTrue: [
		n1 := n copy.
		[ (sz := n1 size) > 3 ] 
			whileTrue: [ n1 := n1 allButLast: 3. ].
		aStream nextPutAll: n1.
		n size > 3 ifTrue: [ aStream nextPutAll: self separator ].
		n := n allButFirst: sz ].
	aStream nextPutAll: (s allButFirst: (s copyUpTo: $.) size)
]

{ #category : #reading }
Money >> readFrom: aStream [
	| number thousands curr currencies |
	currencies := Locale knownLocales values collect: [ :loc | loc primCurrencySymbol ].
	curr := WriteStream on: String new.
	number := 0.

	['-+0123456789. ' includes: aStream peek] whileFalse: [ curr nextPut: aStream next ].
	
	curr contents = '' 
		ifTrue: [ currency := Locale current primCurrencySymbol ]
		ifFalse: [ (currencies anySatisfy: [ :each | curr contents match: each])
			ifFalse: [ Error signal: 'Invalid Money argument']
			ifTrue: [ currency := curr contents ] ].
	
	aStream peek = $ ifTrue: [ aStream next ].
	thousands := (aStream contents allButFirst: (aStream position)) substrings: (Array with: self separator first).
	thousands allButLastDo: [ :each | 
		number := (number + each asInteger) * 1000 ].
	number := number asFloat + (thousands last asNumber).
	amount := number
]

{ #category : #accessing }
Money >> separator [
	^Locale current primDigitGrouping
]

{ #category : #'initialize-release' }
Money >> setAmount: aNumber currency: aString [
	amount := (self normalizeAmount: aNumber).
	currency := aString
]
