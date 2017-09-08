as yet unclassified
add: aMoney
	aMoney asSingleCurrencyValues do:
		[:ea |
		byCurrency at: ea currency put: (self moneyForCurrency: ea currency) + ea].
	^ aMoney