as yet unclassified
testReadFrom
	| money strm |
	strm := ReadStream on: '12,000,123.45'.
	money := Money new readFrom: strm.
	self assert:  money currency = Locale current primCurrencySymbol.
	self assert:  money amount = 12000123.45 .
	
	strm := ReadStream on: '$12,000,123.45'.
	money := Money new readFrom: strm.
	self assert: money currency = '$' .
	self assert:  money amount = 12000123.45 .
	
	strm := ReadStream on: '$ 12,000,123.45'.
	money := Money new readFrom: strm.
	self assert: money currency = '$' .
	self assert:  money amount = 12000123.45.
	