as yet unclassified
/ aNumber
	| result |
	aNumber isMoney ifTrue: [self error: 'Cannot divide two money values'].
	result := MoneyBag new.
	self asSingleCurrencyValues do: [:ea | result add: (ea / aNumber)].
	^ result