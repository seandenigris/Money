arithmetic
* other
	other isMoney ifTrue: [self error: 'Cannot multiply two money values'].
	^ self class amount: self amount * other currency: self currency