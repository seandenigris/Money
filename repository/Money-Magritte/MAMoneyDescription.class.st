"
Money decoded from a string uses a float for the amount. See class comment for more info. For other e.g. ScaledDecimal precision, create and set a custom string reader which implements ==#visitMoneyDescription:== with something like this:
[[[language=smalltalk
	^ Money amount: (ScaledDecimal readFrom: (self copyWithout: $,)) currency: #USD
]]]
"
Class {
	#name : #MAMoneyDescription,
	#superclass : #MAElementDescription,
	#category : #'Money-Magritte'
}

{ #category : #'accessing-defaults' }
MAMoneyDescription class >> defaultKind [
	^ Money
]

{ #category : #testing }
MAMoneyDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MAMoneyDescription class >> label [
	^ 'Money'
]

{ #category : #visiting }
MAMoneyDescription >> acceptMagritte: aVisitor [
	aVisitor visitMoneyDescription: self
]
