as yet unclassified
adaptToNumber: aNumber andSend: aSymbol
	aSymbol = #/ ifTrue: [self error: 'Cannot divide by money'].
	"most other cases will error nicely, so we don't need to worry about order"
	^ self perform: aSymbol with: aNumber