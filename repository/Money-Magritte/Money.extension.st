Extension { #name : #Money }

{ #category : #'*Money-Magritte' }
Money >> amountDescription [
	<magritteDescription>
	^ MANumberDescription new
		accessor: #amount;
		kind: ScaledDecimal;
		priority: 100;
		yourself
]

{ #category : #'*Money-Magritte' }
Money >> currencyDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		accessor: #currency;
		default: #USD;
		classes: { ByteString. Currency };
		priority: 100;
		yourself
]
