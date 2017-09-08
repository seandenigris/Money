accessing
decimal
	^decimal ifNil: [ decimal := Locale current primDecimalSymbol ]