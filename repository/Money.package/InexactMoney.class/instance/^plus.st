arithmetic
+ other
	other = 0 ifTrue: [^ self].
	other isMoney ifFalse: [self errorNotMoney].
	other currency = currency ifTrue:
		[^ self class amount: (amount asFloat) + other amount currency:  currency]
	ifFalse:[^ self class amount:(amount asFloat) + (other convertTo: currency) amount currency: currency]