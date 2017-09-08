initialize-release
setAmount: aNumber currency: aCurrency
	amount := (self normalizeAmount: aNumber).
	currency := aCurrency