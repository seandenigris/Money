initialize-release
setAmount: aNumber currency: aString
	amount _ (self normalizeAmount: aNumber).
	currency _ aString