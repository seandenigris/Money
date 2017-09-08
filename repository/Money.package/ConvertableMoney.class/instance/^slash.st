arithmetic
/ other
	other isMoney
		ifTrue: [ 
			other currency = currency
				ifTrue: [ ^ amount / other amount ]
				ifFalse: [ ^ self / (other convertTo: currency) ] ].
	^ self class amount: amount / other currency: currency