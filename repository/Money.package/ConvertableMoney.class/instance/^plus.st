arithmetic
+ other
	other = 0 ifTrue: [^ self].
	other isMoney ifFalse: [self errorNotMoney].
	other currency = self currency ifTrue:
		[^ self class amount: self amount + other amount currencyCode: self currency]
	ifFalse:[^ self class amount: self amount + (other convertTo: self currency) amount currencyCode: self currency]