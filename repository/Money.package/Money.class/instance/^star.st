arithmetic
* other
	other isMoney ifTrue: [self error: 'Cannot multiply two money values'].
	^ Money amount: self amount * other currencyCode: self currency