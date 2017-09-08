accessing
numericCode: anObject
|number|
number:= [anObject squeezeOutNumber ]on:Error do:[nil] .

numericCode := number