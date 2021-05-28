Class {
	#name : #MoneyTest,
	#superclass : #TestCase,
	#category : #Money
}

{ #category : #tests }
MoneyTest >> testCentArithmetic [
	self assert: (0.3 asMoney: #CAD) * 3 - (0.9 asMoney: #CAD) = (0 asMoney: #CAD)
]

{ #category : #tests }
MoneyTest >> testDivision [
	self assert: (3 asMoney: #CAD) / 3 = (1 asMoney: #CAD).
	self should: [3 / (3 asMoney: #CAD)] raise: Error.
	
	self assert: ((3 asMoney: #CAD) + (6 asMoney: #USD)) / 3 = ((1 asMoney: #CAD) + (2 asMoney: #USD))
]

{ #category : #tests }
MoneyTest >> testEquality [
	self assert: (12 asMoney: #CAD) = (12 asMoney: #CAD).
	self deny: (12 asMoney: #CAD) = (10 asMoney: #CAD).
	self deny: (12 asMoney: #CAD) = (12 asMoney: #USD)
]

{ #category : #tests }
MoneyTest >> testMultiCurrencyArithmetic [
	self assert: (12 asMoney: #CAD) + (2 asMoney: #USD) = ((6 asMoney: #CAD) + (1 asMoney: #USD) + (6 asMoney: #CAD) + (1 asMoney: #USD)).
	self assert: (20 asMoney: #CAD) + (5 asMoney: #USD) - (5 asMoney: #CAD) = ((15 asMoney: #CAD) + (5 asMoney: #USD)).
	self assert: (20 asMoney: #CAD) + (5 asMoney: #USD) - (5 asMoney: #USD) = ((20 asMoney: #CAD)).
	self deny: (5 asMoney: #CAD) + (5 asMoney: #USD) = ((5 asMoney: #CAD) + (5 asMoney: #CAD))
]

{ #category : #tests }
MoneyTest >> testMultiCurrencyPrinting [
	self assert: ((12 asMoney: #CAD) + (12.5 asMoney: #USD)) asString equals: 'USD 12.50, CAD 12.00'
]

{ #category : #tests }
MoneyTest >> testNonMoneyArithmetic [
	self should: [(12 asMoney: #CAD) + 10] raise: Error.
	self should: [10 + (12 asMoney: #CAD)] raise: Error
]

{ #category : #tests }
MoneyTest >> testPrintOn [
	| money |
	money := 12000123.45 asMoney: Money localCurrencySymbol.
	self assert: money printString = (money currency , ' 12,000,123.45').
	
	money := -140 asMoney: Money localCurrencySymbol.
	self assert: money printString = (money currency , ' -140.00')
]

{ #category : #tests }
MoneyTest >> testReadFrom [
	| money strm |
	strm := ReadStream on: '12,000,123.45'.
	money := Money new readFrom: strm.
	self assert:  money currency = Money localCurrencySymbol.
	self assert:  money amount = 12000123.45 .
	
	strm := ReadStream on: '$12,000,123.45'.
	money := Money new readFrom: strm.
	self assert: money currency = '$' .
	self assert:  money amount = 12000123.45 .
	
	strm := ReadStream on: '$ 12,000,123.45'.
	money := Money new readFrom: strm.
	self assert: money currency = '$' .
	self assert:  money amount = 12000123.45.
	
]

{ #category : #tests }
MoneyTest >> testRounding [
	self assert: ((1/3 asMoney: #CAD) * 3) nearestCent = 1.00
]

{ #category : #tests }
MoneyTest >> testSameCurrencyArithmetic [
	self assert: (12 asMoney: #CAD) + (10 asMoney: #CAD) = (22 asMoney: #CAD).
	self assert: (20 asMoney: #CAD) - (5 asMoney: #CAD) = (15 asMoney: #CAD).
	self assert: (3 asMoney: #CAD) * 4 = (12 asMoney: #CAD).
	self assert: 5 * (2 asMoney: #CAD) = (10 asMoney: #CAD).
]

{ #category : #tests }
MoneyTest >> testSingleCurrencyPrinting [
	self assert: (12 asMoney: #CAD) asString = 'CAD 12.00'.
	self assert: (12.2 asMoney: #CAD) asString = 'CAD 12.20'.
	self assert: (1.2323 asMoney: #USD) asString = 'USD 1.23'.
	
]
