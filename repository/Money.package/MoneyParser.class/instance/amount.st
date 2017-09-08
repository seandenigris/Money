accessing
amount
	^ ((thousands plus foldLeft: [ :a :b | (a * 1000) + b ]) , cents optional) foldLeft: [ :a :b | (a + b) ]