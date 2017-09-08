accessing
numericCode: anObject
|number|
number:= [ anObject asInteger ]on:Error do:[nil] .

numericCode := number