instance creation
readFrom: aStream
	"^MoneyParser instance parse: aStream 
		onError: [ Error signal: 'Invalid Money input']"
	^self new readFrom: aStream
