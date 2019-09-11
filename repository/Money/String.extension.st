Extension { #name : #String }

{ #category : #'*money' }
String >> asConvertableMoney [
	^ ConvertableMoney fromString: self
]
