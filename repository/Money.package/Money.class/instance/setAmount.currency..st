initialize-release
setAmount: aNumber currency: aString
	amount := (self normalizeAmount: aNumber).
	currency := aString