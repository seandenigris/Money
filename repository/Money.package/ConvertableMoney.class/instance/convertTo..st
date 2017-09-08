comparing
convertTo: aCurrency
	| from to rate |
	from := self currency conversionRateToUSD.
	to := aCurrency conversionRateToUSD.
	from isNil
		ifTrue: [ ^ self ].
	to isNil
		ifTrue: [ ^ self ].
	rate := to / from.
	^ self class amount: rate * self amount currency: aCurrency