as yet unclassified
+ other
	other = 0 ifTrue: [^ self].
	other isMoney ifFalse: [self errorNotMoney].
	other currency = self currency ifTrue:
		[^ Money amount: self amount + other amount currency: self currency].
	^ MoneyBag new
		add: other;
		add: self;
		yourself