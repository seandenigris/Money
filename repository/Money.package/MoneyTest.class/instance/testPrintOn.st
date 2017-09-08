as yet unclassified
testPrintOn
	| money |
	money := 12000123.45 asMoney: Locale current primCurrencySymbol.
	self assert: (money printString = (money currency , ' 12,000,123.45') )