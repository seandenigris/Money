arithmetic
\\ other
	other isMoney ifTrue: [self error: 'Cannot \\ two money values'].
	^ self class amount: (self amount asFloat) \\ other currencyCode: self currency