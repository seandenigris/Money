accessing
storeValueOfElement: xmlNodeName from: nodes inInstVar: aSymbol of: newCurrency
	| node nodeString |
	node := nodes elementAt: xmlNodeName ifAbsent: [ nil ].
	node isNil
		ifTrue: [ ^ self ].
	nodeString := node strings first.
	(#('No universal currency') includes: nodeString)
		ifFalse: [ newCurrency perform: aSymbol with: nodeString ]