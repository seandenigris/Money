"
InexactMoney is exactly like ConvertableMoney but is uses floats for math rather than fractions.
"
Class {
	#name : #InexactMoney,
	#superclass : #ConvertableMoney,
	#category : 'Money'
}

{ #category : #arithmetic }
InexactMoney >> * other [
	other isMoney ifTrue: [self error: 'Cannot multiply two money values'].
	^ self class amount: ( amount asFloat) * other currency:  currency
]

{ #category : #arithmetic }
InexactMoney >> + other [
	other = 0 ifTrue: [^ self].
	other isMoney ifFalse: [self errorNotMoney].
	other currency = currency ifTrue:
		[^ self class amount: (amount asFloat) + other amount currency:  currency]
	ifFalse:[^ self class amount:(amount asFloat) + (other convertTo: currency) amount currency: currency]
]

{ #category : #arithmetic }
InexactMoney >> - other [
	other = 0 ifTrue: [^ self].
	other isMoney ifFalse: [self errorNotMoney].
	other currency = currency ifTrue:
		[^ self class amount: (amount asFloat)- other amount currency: currency].
	^ self + (other * -1) asFloat
]

{ #category : #arithmetic }
InexactMoney >> / other [
	other isMoney
		ifTrue: [ 
			other currency = currency
				ifTrue: [ ^ amount asFloat / other amount ]
				ifFalse: [ ^ self / (other convertTo: currency) ] ].
	^ self class amount: amount asFloat / other currency: currency
]

{ #category : #arithmetic }
InexactMoney >> \\ other [
	other isMoney ifTrue: [self error: 'Cannot \\ two money values'].
	^ self class amount: (amount asFloat) \\ other currency: currency
]

{ #category : #arithmetic }
InexactMoney >> adaptToNumber: aNumber andSend: aSymbol [
	aSymbol = #/ ifTrue: [self error: 'Cannot divide by money'].
	"most other cases will error nicely, so we don't need to worry about order"
	^ self perform: aSymbol with: aNumber
]

{ #category : #arithmetic }
InexactMoney >> asInexactMoney [
	^ self
]

{ #category : #arithmetic }
InexactMoney >> normalizeAmount: aNumber [
	^ aNumber asNumber asFloat
]
