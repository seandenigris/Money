arithmetic
+ other
	other = 0 ifTrue: [^ self].
	other isMoney ifFalse: [self errorNotMoney].
	other currency = self currency ifTrue:
		[^ self class amount: self amount + other amount currency: self currency]
	ifFalse:[^ self class amount: self amount + (other convertTo: self currency) amount currency: self currency]