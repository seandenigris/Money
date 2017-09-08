as yet unclassified
/ other
	other isMoney ifTrue: [self error: 'Cannot divide two money values'].
	^ Money amount: self amount / other currency: self currency