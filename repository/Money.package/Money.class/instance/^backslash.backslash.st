arithmetic
\\ other
	other isMoney ifTrue: [self error: 'Cannot \\ two money values'].
	^ Money amount: self amount \\ other currencyCode: self currency