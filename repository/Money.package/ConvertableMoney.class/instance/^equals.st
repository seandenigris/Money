comparing
= other
|converted |
	^ other species = self species and:[
	self currency = other currency ifTrue: [other amount=self amount] ifFalse: [converted := other convertTo: self currency.
		converted amount=self amount ]]