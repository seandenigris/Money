accessing
separator
	^separator ifNil: [ separator := Locale current primDigitGrouping ]