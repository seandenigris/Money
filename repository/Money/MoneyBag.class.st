Class {
	#name : #MoneyBag,
	#superclass : #Object,
	#instVars : [
		'byCurrency'
	],
	#category : 'Money'
}

{ #category : #'as yet unclassified' }
MoneyBag >> * aNumber [
	| result |
	aNumber isMoney ifTrue: [self error: 'Cannot multiply two money values'].
	result _ MoneyBag new.
	self asSingleCurrencyValues do: [:ea | result add: (ea * aNumber)].
	^ result
]

{ #category : #'as yet unclassified' }
MoneyBag >> + other [
	^ MoneyBag new
		add: other;
		add: self;
		yourself
]

{ #category : #'as yet unclassified' }
MoneyBag >> - other [
	| result |
	result := self + (other * -1).
	result asSingleCurrencyValues size = 1 ifTrue: [^ result asSingleCurrencyValues anyOne].
	^ result
]

{ #category : #'as yet unclassified' }
MoneyBag >> / aNumber [
	| result |
	aNumber isMoney ifTrue: [self error: 'Cannot divide two money values'].
	result := MoneyBag new.
	self asSingleCurrencyValues do: [:ea | result add: (ea / aNumber)].
	^ result
]

{ #category : #'as yet unclassified' }
MoneyBag >> = other [
	^ other species = self species
		and: [other asSingleCurrencyValues = self asSingleCurrencyValues]
]

{ #category : #'as yet unclassified' }
MoneyBag >> add: aMoney [
	aMoney asSingleCurrencyValues do:
		[:ea |
		byCurrency at: ea currency put: (self moneyForCurrency: ea currency) + ea].
	^ aMoney
]

{ #category : #'as yet unclassified' }
MoneyBag >> asSingleCurrencyValues [
	^ byCurrency values reject: [:ea | ea amount = 0]
]

{ #category : #'as yet unclassified' }
MoneyBag >> hash [
	^ byCurrency hash
]

{ #category : #'as yet unclassified' }
MoneyBag >> initialize [
	byCurrency := Dictionary new
]

{ #category : #'as yet unclassified' }
MoneyBag >> isMoney [
	^ true
]

{ #category : #'as yet unclassified' }
MoneyBag >> isSingleCurrency [
	^ false
]

{ #category : #'as yet unclassified' }
MoneyBag >> moneyForCurrency: aString [
	^ byCurrency at: aString ifAbsent: [Money amount: 0 currencyCode: aString]
]

{ #category : #'as yet unclassified' }
MoneyBag >> printOn: aStream [
	self asSingleCurrencyValues do: [:ea | ea printOn: aStream] separatedBy: [aStream nextPutAll: ', ']
]
