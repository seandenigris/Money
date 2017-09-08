arithmetic
- other
	other = 0 ifTrue: [^ self].
	other isMoney ifFalse: [self errorNotMoney].
	other currency = self currency ifTrue:
		[^ self class amount: (self amount asFloat)- other amount currencyCode: self currency].
	^ self + (other * - 1) asFloat