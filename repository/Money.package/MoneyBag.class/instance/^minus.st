as yet unclassified
- other
	| result |
	result _ self + (other * -1).
	result asSingleCurrencyValues size = 1 ifTrue: [^ result asSingleCurrencyValues anyOne].
	^ result