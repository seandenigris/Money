as yet unclassified
printOn: aStream
	self asSingleCurrencyValues do: [:ea | ea printOn: aStream] separatedBy: [aStream nextPutAll: ', ']