as yet unclassified
* aNumber
	| result |
	aNumber isMoney ifTrue: [self error: 'Cannot multiply two money values'].
	result _ MoneyBag new.
	self asSingleCurrencyValues do: [:ea | result add: (ea * aNumber)].
	^ result