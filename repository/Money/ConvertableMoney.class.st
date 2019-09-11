"
ConvertableMoney uses the Currency class to provide additional context into the value of an amount of money.  It can convert between and perform arithmetic on multiple currencies at once. 


"
Class {
	#name : #ConvertableMoney,
	#superclass : #Magnitude,
	#instVars : [
		'amount',
		'currency'
	],
	#category : 'Money'
}

{ #category : #'as yet unclassified' }
ConvertableMoney class >> amount: aNumber countryName: aString [
	^ self basicNew setAmount: aNumber currency: (Currency getFromCountryName: aString)
]

{ #category : #'as yet unclassified' }
ConvertableMoney class >> amount: aNumber currency: aCurrency [
	^ self basicNew setAmount: aNumber currency: aCurrency
]

{ #category : #'as yet unclassified' }
ConvertableMoney class >> amount: aNumber currencyCode: aString [
  ^ self basicNew
    setAmount: aNumber
    currency: (Currency getFromCurrencyCode: aString asUppercase)
]

{ #category : #'as yet unclassified' }
ConvertableMoney class >> amount: aNumber currencyName: aString [
	^ self basicNew setAmount: aNumber currency: (Currency getFromName: aString)
]

{ #category : #'as yet unclassified' }
ConvertableMoney class >> fromString: aString [
	^ self new readFrom: aString readStream
]

{ #category : #'as yet unclassified' }
ConvertableMoney class >> readFrom: aStream [
	^ self new readFrom: aStream

]

{ #category : #'as yet unclassified' }
ConvertableMoney class >> zero [
	^self amount: 0 currencyCode: 'USD'
]

{ #category : #arithmetic }
ConvertableMoney >> * other [
	other isMoney ifTrue: [self error: 'Cannot multiply two money values'].
	^ self class amount: self amount * other currency: self currency
]

{ #category : #arithmetic }
ConvertableMoney >> + other [
	other = 0 ifTrue: [^ self].
	other isMoney ifFalse: [self errorNotMoney].
	other currency = self currency ifTrue:
		[^ self class amount: self amount + other amount currency: self currency]
	ifFalse:[^ self class amount: self amount + (other convertTo: self currency) amount currency: self currency]
]

{ #category : #arithmetic }
ConvertableMoney >> - other [
	other = 0 ifTrue: [^ self].
	other isMoney ifFalse: [self errorNotMoney].
	other currency = self currency ifTrue:
		[^ self class amount: self amount - other amount currency: self currency].
	^ self + (other * -1)
]

{ #category : #arithmetic }
ConvertableMoney >> / other [
	other isMoney
		ifTrue: [ 
			other currency = currency
				ifTrue: [ ^ amount / other amount ]
				ifFalse: [ ^ self / (other convertTo: currency) ] ].
	^ self class amount: amount / other currency: currency
]

{ #category : #arithmetic }
ConvertableMoney >> < other [
|converted|
	currency = other currency
		ifTrue: [ ^( amount < other amount )]
		ifFalse: [ converted:= other convertTo: currency.
					^(self < converted). ]
]

{ #category : #comparing }
ConvertableMoney >> = other [
|converted |
	^ other species = self species and:[
	self currency = other currency ifTrue: [other amount=self amount] ifFalse: [converted := other convertTo: self currency.
		converted amount=self amount ]]
]

{ #category : #arithmetic }
ConvertableMoney >> \\ other [
	other isMoney ifTrue: [self error: 'Cannot \\ two money values'].
	^ self class amount: self amount \\ other currency: self currency
]

{ #category : #arithmetic }
ConvertableMoney >> acceptMagritte: aVisitor [
	aVisitor visitMoneyDescription: self
]

{ #category : #visiting }
ConvertableMoney >> acceptRoeVisitor: aVisitor [
	aVisitor visitMoney: self
]

{ #category : #arithmetic }
ConvertableMoney >> adaptToNumber: aNumber andSend: aSymbol [
	aSymbol = #/ ifTrue: [self error: 'Cannot divide by money'].
	"most other cases will error nicely, so we don't need to worry about order"
	^ self perform: aSymbol with: aNumber
]

{ #category : #accessing }
ConvertableMoney >> amount [
	^ amount
]

{ #category : #accessing }
ConvertableMoney >> amount: anObject [
	amount := anObject
]

{ #category : #printing }
ConvertableMoney >> amountString [
	^ amount printShowingDecimalPlaces: 2
]

{ #category : #converting }
ConvertableMoney >> asInexactMoney [
	^ InexactMoney amount: self amount asFloat currency: self currency
]

{ #category : #printing }
ConvertableMoney >> asSingleCurrencyValues [
	^ Array with: self
]

{ #category : #comparing }
ConvertableMoney >> convertTo: aCurrency [
	| from to rate |
	from := self currency conversionRateToUSD.
	to := aCurrency conversionRateToUSD.
	from isNil
		ifTrue: [ ^ self ].
	to isNil
		ifTrue: [ ^ self ].
	rate := to / from.
	^ self class amount: rate * self amount currency: aCurrency
]

{ #category : #comparing }
ConvertableMoney >> convertToCode: aCurrencyCodeString [
	^ self convertTo: (Currency getFromCurrencyCode: aCurrencyCodeString)
]

{ #category : #accessing }
ConvertableMoney >> currency [
	^ currency ifNil: [ currency := Currency localCurrency ]
]

{ #category : #accessing }
ConvertableMoney >> currency: anObject [
	^ currency := anObject
]

{ #category : #accessing }
ConvertableMoney >> currencyCode [
	^ self currency currencyCode
]

{ #category : #accessing }
ConvertableMoney >> currencySymbol [
  currency isString
    ifTrue: [ currency := Currency getFromCurrencyCode: currency ].
  ^ self currency symbol
]

{ #category : #accessing }
ConvertableMoney >> decimal [
	^Locale current primDecimalSymbol first
]

{ #category : #comparing }
ConvertableMoney >> errorNotMoney [
	self error: 'Invalid arithmetic operation between money and non-money value'
]

{ #category : #comparing }
ConvertableMoney >> hash [
	^ amount hash bitXor: currency hash
]

{ #category : #testing }
ConvertableMoney >> isMoney [
	^ true
]

{ #category : #testing }
ConvertableMoney >> isNumber [
	^ true
]

{ #category : #testing }
ConvertableMoney >> isSingleCurrency [
	^ true
]

{ #category : #arithmetic }
ConvertableMoney >> nearestCent [
	^ amount roundTo: 0.01
]

{ #category : #arithmetic }
ConvertableMoney >> normalizeAmount: aNumber [

	^ (aNumber * 10000) rounded / 10000
]

{ #category : #printing }
ConvertableMoney >> printOn: aStream [
	self useSymbol
		ifTrue: [ 
			self currency isNil
				ifFalse: [ aStream nextPutAll: currency symbol ] ]
		ifFalse: [ 
			self currency isNil
				ifFalse: [ 
					aStream nextPutAll: currency currencyCode.
					aStream space ] ].
	self printSeparated: self amount on: aStream
]

{ #category : #printing }
ConvertableMoney >> printSeparated: aNumber on: aStream [
	| s n n1 sz |
	s := aNumber printShowingDecimalPlaces: 2.
	n := s copyUpTo: self decimal.
	
	[ n size > 0 ] whileTrue: [
		n1 := n copy.
		[ (sz := n1 size) > 3 ] 
			whileTrue: [ n1 := n1 allButLast: 3. ].
		aStream nextPutAll: n1.
		n size > 3 ifTrue: [ aStream nextPutAll: self separator ].
		n := n allButFirst: sz ].
	aStream nextPutAll: (s allButFirst: (s copyUpTo: $.) size)
]

{ #category : #reading }
ConvertableMoney >> readFrom: aStream [
	| number thousands curr |
	curr := WriteStream on: String new.
	number := 0.
	[ '-+0123456789. ' includes: aStream peek ] whileFalse: [ curr nextPut: aStream next ].
	curr contents = ''
		ifTrue: [ currency := Currency localCurrency ]
		ifFalse: [ currency := Currency getFromSymbol: curr contents ].
	aStream peek = $ 
		ifTrue: [ aStream next ].
	thousands := (aStream contents allButFirst: aStream position) substrings: (Array with: self separator first).
	thousands allButLastDo: [ :each | number := (number + each asInteger) * 1000 ].
	number := number asFloat + thousands last asNumber.
	amount := number
]

{ #category : #comparing }
ConvertableMoney >> renderCurrencyLocaleFormattingScriptOn: html [
	"Safari does not yet support JS internationalization.  So we skip this function if its not supported and just use what we render in the #renderOn: method in this class"

	| locale |
	locale := (html requestContext request headers at: 'accept-language' ifAbsent: [ 'en-US' ]) copyFrom: 1 to: 5.
	^ JSStream
		on:
			'if( typeof(window.Intl) !== "undefined" ){
			var amt, str; 
			amt = Number.parseFloat($("#' , html lastId
				,
					'").text());
			str = amt.toLocaleString("' , locale , '",{style:"currency",currency:"' , currency currencyCode
				, '",minimumFractionDigits:"' , currency minorUnit
				,
					'"});
			$("#' , html lastId
				,
					'").parent().text(str);	
				};'
]

{ #category : #comparing }
ConvertableMoney >> renderOn: html [
	html span
		class: 'cur';
		with: [ 
					html span
						class: 'sym';
						with: self currencySymbol.
					html span
						class: 'amt';
						id: html nextId;
						script: (self renderCurrencyLocaleFormattingScriptOn: html);
						with: (self amount printShowingDecimalPlaces: 2) ]
]

{ #category : #accessing }
ConvertableMoney >> separator [
	^Locale current primDigitGrouping
]

{ #category : #'initialize-release' }
ConvertableMoney >> setAmount: aNumber currency: aCurrency [
	amount := (self normalizeAmount: aNumber).
	currency := aCurrency
]

{ #category : #comparing }
ConvertableMoney >> useSymbol [
	" true to print the currency symbol false to print the currency code."
	^true
]
