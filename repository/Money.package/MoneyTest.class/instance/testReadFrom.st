as yet unclassified
testReadFrom
	| money strm |
	strm := ReadStream on: '12000123'.
	money := Money readFrom: strm.
	self assert: [ money currency = Locale current primCurrencySymbol].
	self assert: [ (money amount - 12000123) = 0 ].
	
	strm := ReadStream on: '$12,000,123.45'.
	money := Money readFrom: strm.
	self assert: [ money currency = '$' ].
	self assert: [ (money amount - 12000123.45) = 0 ].
	
	strm := ReadStream on: '$ 12,000,123.45'.
	money := Money readFrom: strm.
	self assert: [ money currency = '$' ].
	self assert: [ (money amount - 12000123.45) = 0 ].
	