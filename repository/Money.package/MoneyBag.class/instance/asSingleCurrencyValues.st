as yet unclassified
asSingleCurrencyValues
	^ byCurrency values reject: [:ea | ea amount = 0]