arithmetic
- other
	other = 0 ifTrue: [^ self].
	other isMoney ifFalse: [self errorNotMoney].
	other currency = currency ifTrue:
		[^ self class amount: (amount asFloat)- other amount currency: currency].
	^ self + (other * -1) asFloat