as yet unclassified
readFrom: aStream
	^MoneyParser instance parse: aStream 
		onError: [ Error signal: 'Invalid Money input']
