accessing
amount
	^ ((thousands plus foldLeft: [ :a :b | (a * 1000) + b ]) , cents optional) ==> [ :nodes |
			nodes second isNil
				ifFalse: [ nodes first + nodes second ]
				ifTrue: [ nodes first ] ]