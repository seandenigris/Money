arithmetic
< other
|converted|
	currency = other currency
		ifTrue: [ ^( amount < other amount )]
		ifFalse: [ converted:= other convertTo: currency.
					^(self < converted). ]