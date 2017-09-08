comparing
< other
|converted|
	self currency = other currency
		ifTrue: [ ^ self amount < other amount or: [ self amount = other amount and: [ self currency < other currency ] ] ]
		ifFalse: [ converted:= other convertTo: self currency.
					self < converted. ]