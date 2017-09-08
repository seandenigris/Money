arithmetic
+ other
	other = 0 ifTrue: [^ self].
	other isMoney ifFalse: [self errorNotMoney].
	other currency = self currency ifTrue:
		[^ Money amount: self amount + other amount currencyCode: self currency]
	ifFalse:[^ Money amount: self amount + (other convertTo: self currency) amount currencyCode: self currency]