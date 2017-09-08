arithmetic
/ other
	other isMoney
		ifTrue: [ 
			other currency = currency
				ifTrue: [ ^ amount asFloat / other amount ]
				ifFalse: [ ^ self / (other convertTo: currency) ] ].
	^ self class amount: amount asFloat / other currency: currency