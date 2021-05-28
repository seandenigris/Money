"
An object to store information and collect conversion rates for currencies from openexchangerates.org and calculate the cross rates among all convertable currencies.  

Use: 

Currency setConvertableCurrenciesAndRates

to update the rates.  


Uses the list of the currencies from http://en.wikipedia.org/wiki/List_of_circulating_currencies as of 10-21-2009 as the base list.

Rates may not be accurate. YMMV. MIT license.  etc.  

"
Class {
	#name : #Currency,
	#superclass : #Object,
	#instVars : [
		'currency',
		'symbol',
		'country',
		'currencyName',
		'conversionRateToUSD',
		'numericCode',
		'minorUnit'
	],
	#classInstVars : [
		'convertableCurrencies',
		'currenciesUpdated',
		'currencies',
		'currencyCodesAndSymbols'
	],
	#category : #Money
}

{ #category : #updating }
Currency class >> appId [
	^ '/?app_id=' , self openExchangeRateAppId
]

{ #category : #updating }
Currency class >> baseUrl [
	^ 'http://openexchangerates.org/api/'
]

{ #category : #accessing }
Currency class >> convertableCurrencies [
	 convertableCurrencies isNil ifTrue:[self setConvertableCurrenciesAndRates  ].
	^convertableCurrencies 
]

{ #category : #accessing }
Currency class >> convertableCurrencies: anObject [
	convertableCurrencies := anObject
]

{ #category : #'as yet unclassified' }
Currency class >> currencies [
	currencies isNil ifTrue:[ self initializeCurrencies ].
	^currencies 
]

{ #category : #accessing }
Currency class >> currenciesUpdated [
	^ currenciesUpdated
]

{ #category : #accessing }
Currency class >> currenciesUpdated: anObject [
	currenciesUpdated := anObject
]

{ #category : #updating }
Currency class >> currenciesUrl [
	^ self baseUrl , self currencyListPath , self appId
]

{ #category : #updating }
Currency class >> currencyCodesAndSymbols [
	currencyCodesAndSymbols isNil
		ifTrue: [ self setCurrencyCodesAndSymbols ].
	^ currencyCodesAndSymbols
]

{ #category : #updating }
Currency class >> currencyCodesAndUnicodeDecimalsSymbols1 [
	"because on gemstone monticello bugs out with WideStrings "

	^ {('HKD' -> #(36)).
	('STD' -> #(68 98)).
	('KYD' -> #(36)).
	('UYU' -> #(36)).
	('PEN' -> #(83 47 46)).
	('RUB' -> #(1088 1091 1073 46)).
	('ANG' -> #(402)).
	('SCR' -> #(8360)).
	('TZS' -> #(83 104)).
	('ERN' -> #(78 102 107)).
	('ISK' -> #(107 114)).
	('KPW' -> #(8361)).
	('PKR' -> #(8360)).
	('YER' -> #(65020)).
	('UGX' -> #(83 104)).
	('GMD' -> #(68)).
	('GNF' -> #(70 114)).
	('ZMK' -> #(90 75)).
	('AFN' -> #(1547)).
	('KGS' -> #()).
	('OMR' -> #(1585 46 1593 46)).
	('CAD' -> #(36)).
	('XCD' -> #(36)).
	('MOP' -> #(80)).
	('BRL' -> #(82 36)).
	('ZAR' -> #(82)).
	('SRD' -> #(36)).
	('EUR' -> #(8364)).
	('CUC' -> #(36)).
	('KWD' -> #(1583 46 1603)).
	('ZWR' -> #(36)).
	('SLL' -> #(76 101)).
	('PHP' -> #(8369)).
	('SDG' -> #(163)).
	('SAR' -> #(1585 46 1587)).
	('LRD' -> #(36)).
	('MUR' -> #(8360)).
	('AED' -> #(1583 46 1573)).
	('BTN' -> #()).
	('NPR' -> #(8360)).
	('VUV' -> #(86 116)).
	('BIF' -> #(70 114)).
	('EEK' -> #(75 82)).
	('GEL' -> #(4314)).
	('BZD' -> #(36)).
	('NIO' -> #(67 36)).
	('TND' -> #(1583 46 1578)).
	('KES' -> #(83 104)).
	('CDF' -> #(70 114)).
	('RON' -> #(76)).
	('AZN' -> #(32)).
	('DKK' -> #(107 114)).
	('PAB' -> #(66 47 46)).
	('NGN' -> #(8358)).
	('MGA' -> #()).
	('CUP' -> #(36)).
	('MDL' -> #(76)).
	('KZT' -> #(12306)).
	('FJD' -> #(36)).
	('RWF' -> #(70 114)).
	('TOP' -> #(84 36)).
	('BBD' -> #(36)).
	('MKD' -> #(1076 1077 1085)).
	('BWP' -> #(80)).
	('CNY' -> #(20803)).
	('GIP' -> #(163)).
	('RSD' -> #(1076 1080 1085 46 32)).
	('SEK' -> #(107 114)).
	('CVE' -> #(36)).
	('FKP' -> #(163)).
	('HRK' -> #(107 110)).
	('BYR' -> #(66 114)).
	('THB' -> #(3647)).
	('IDR' -> #(82 112)).
	('JPY' -> #(165)).
	('XAF' -> #(70 114)).
	('CRC' -> #(8353)).
	('DOP' -> #(36)).
	('NZD' -> #(36)).
	('MZN' -> #(77 84 110)).
	('MWK' -> #(77 75)).
	('QAR' -> #(1585 46 1602)).
	('HNL' -> #(76)).
	('VEF' -> #(66 115 32 70))}
]

{ #category : #updating }
Currency class >> currencyCodesAndUnicodeDecimalsSymbols2 [
	"because on gemstone monticello bugs out with WideStrings "

	^ {('BSD' -> #(36)).
	('SOS' -> #(83 104)).
	('AUD' -> #(36)).
	('JOD' -> #(1583 46 1575)).
	('BOB' -> #(66 115 46)).
	('EGP' -> #(1580 46 1605)).
	('GHS' -> #(8373)).
	('NOK' -> #(107 114)).
	('IQD' -> #(1593 46 1583)).
	('PYG' -> #(8370)).
	('MXN' -> #(36)).
	('BDT' -> #(2547)).
	('AOA' -> #(75 122)).
	('None' -> #(83 104)).
	('LAK' -> #(8365)).
	('COP' -> #(36)).
	('ALL' -> #(76)).
	('GBP' -> #(163)).
	('SZL' -> #(76)).
	('MNT' -> #(8366)).
	('GYD' -> #(36)).
	('JMD' -> #(36)).
	('SGD' -> #(36)).
	('LVL' -> #(76 115)).
	('CLP' -> #(36)).
	('BND' -> #(36)).
	('LKR' -> #(82 115)).
	('KMF' -> #(70 114)).
	('CZK' -> #(75 269)).
	('HUF' -> #(70 116)).
	('AWG' -> #(402)).
	('PGK' -> #(75)).
	('XPF' -> #(70 114)).
	('NAD' -> #(36)).
	('LSL' -> #(76)).
	('SHP' -> #(163)).
	('TJS' -> #(1029 1052)).
	('DJF' -> #(70 114)).
	('LTL' -> #(76 116)).
	('PLN' -> #(122 322)).
	('BGN' -> #(1083 1074)).
	('MMK' -> #(75)).
	('SBD' -> #(36)).
	('BMD' -> #(36)).
	('TRY' -> #(84 76)).
	('IRR' -> #(65020)).
	('TWD' -> #(36)).
	('INR' -> #(82 115)).
	('MAD' -> #(1583 46 1605 46)).
	('SVC' -> #(8353)).
	('XOF' -> #(70 114)).
	('KHR' -> #(6107)).
	('LBP' -> #(1604 46 1604)).
	('ARS' -> #(36)).
	('TTD' -> #(36)).
	('LYD' -> #(1604 46 1583)).
	('USD' -> #(36)).
	('SYP' -> #(1604 46 1587)).
	('HTG' -> #(71)).
	('DZD' -> #(1583 46 1580)).
	('UZS' -> #()).
	('ETB' -> #()).
	('VND' -> #(8363)).
	('GTQ' -> #(81)).
	('TMM' -> #(109)).
	('AMD' -> #(1380 1408 46)).
	('MYR' -> #(82 77)).
	('KRW' -> #(8361)).
	('MRO' -> #(85 77)).
	('BHD' -> #(1576 46 1583)).
	('WST' -> #(84)).
	('CHF' -> #(70 114)).
	('UAH' -> #(8372)).
	('MVR' -> #(1923 46)).
	('ILS' -> #(8362)).
	('BAM' -> #(1050 1052))}
]

{ #category : #updating }
Currency class >> currencyListPath [
	^ 'currencies.json'
]

{ #category : #accessing }
Currency class >> currencyListXmlUrl [
	^ 'http://www.currency-iso.org/dam/downloads/lists/list_one.xml'
]

{ #category : #currencies }
Currency class >> euro [
	^ self currencies detect: [ :each | each country = 'EUROPEAN UNION' and: [ each currencyCode = 'EUR' ] ]
]

{ #category : #accessing }
Currency class >> getFromCountryName: aString [
	^ self currencies detect: [ :each | each country asLowercase = aString asLowercase ] ifNone: [ Currency usDollar ]
]

{ #category : #accessing }
Currency class >> getFromCurrencyCode: aString [
	^ self convertableCurrencies detect: [ :each | each currency = aString ]
]

{ #category : #accessing }
Currency class >> getFromName: aString [
	^ self convertableCurrencies detect: [ :each | each currencyName = aString ]
]

{ #category : #accessing }
Currency class >> getFromSymbol: aString [
	^ self convertableCurrencies detect: [ :each | each symbol = aString ]
]

{ #category : #accessing }
Currency class >> httpClient [
	^ HTTPAPIClient httpClient
]

{ #category : #currencies }
Currency class >> indianRupee [
	^ self currencies detect: [ :each | each country = 'INDIA' and: [ each currencyCode = 'INR' ] ]
]

{ #category : #'class initialization' }
Currency class >> initialize [
	"
Currency initialize.
"

	self updateCurrencies
]

{ #category : #'class initialization' }
Currency class >> initializeCurrencies [
	self populateCurrencyList
]

{ #category : #updating }
Currency class >> latestPath [
	^ 'latest.json'
]

{ #category : #updating }
Currency class >> latestUrl [
	^ self baseUrl , self latestPath , self appId
]

{ #category : #updating }
Currency class >> localCurrency [
	self convertableCurrencies detect: [ :each | each symbol = Money localCurrencySymbol ]
]

{ #category : #'class initialization' }
Currency class >> openExchangeRateAppId [
	"your id goes here"

	^ '43a9dc74b12d492bae83b49aedbecadc'
]

{ #category : #accessing }
Currency class >> populateCurrencyList [
	| currencyXml |
	[ currencyXml := XMLDOMParser parse: (self httpClient get: self currencyListXmlUrl) contents ]
		on: NameLookupFailure
		do: [ 
			Transcript show: 'no network connection'.
			^ self ].
	currencies := OrderedCollection new.
	
		(currencyXml  findElementNamed: 'CcyTbl') nodes 
			select:[:ea | ea isStringNode not] 
			thenDo:
		 [ :eachCurrencyXml | 
			| newCurrency nodes |
			nodes := eachCurrencyXml nodes.
			newCurrency := self new.
			self
				storeValueOfElement: 'CtryNm'
				from: nodes
				inInstVar: #country:
				of: newCurrency.
			self
				storeValueOfElement: 'CcyNm'
				from: nodes
				inInstVar: #currencyName:
				of: newCurrency.
			self
				storeValueOfElement: 'Ccy'
				from: nodes
				inInstVar: #currency:
				of: newCurrency.
			self
				storeValueOfElement: 'CcyMnrUnts'
				from: nodes
				inInstVar: #minorUnit:
				of: newCurrency.
			self
				storeValueOfElement: 'CcyNbr'
				from: nodes
				inInstVar: #numericCode:
				of: newCurrency.
			newCurrency setSymbol.
			currencies add: newCurrency ] 
]

{ #category : #currencies }
Currency class >> renminbi [
	^ self currencies detect: [ :each | each numericCode = 156 ]
]

{ #category : #updating }
Currency class >> setConvertableCurrenciesAndRates [
	| rates first second tmp tmp1rates rate arg argDict |
	rates := (Json readFrom: (self httpClient get: self latestUrl) contents readStream) at: 'rates'.
	self currencies do: [ :each | each conversionRateToUSD: (rates at: each currency ifAbsentPut: [ 0 ]) ].
	self convertableCurrencies: (currencies select: [ :each | each isConvertable ]) asSet asSortedCollection.
	self currenciesUpdated: DateAndTime now
]

{ #category : #updating }
Currency class >> setCurrencyCodesAndSymbols [
	currencyCodesAndSymbols := Dictionary new.
	self currencyCodesAndUnicodeDecimalsSymbols1 , self currencyCodesAndUnicodeDecimalsSymbols2
		do: [ :eachAssoc | 
			| str |
			str := String new: eachAssoc value size.
			eachAssoc value doWithIndex: [ :each :index | str at: index put: each asCharacter ].
			currencyCodesAndSymbols at: eachAssoc key put: str ]
]

{ #category : #accessing }
Currency class >> storeValueOfElement: xmlNodeName from: nodes inInstVar: aSymbol of: newCurrency [
	| node nodeString |
	node := nodes elementAt: xmlNodeName ifAbsent: [ nil ].
	node isNil
		ifTrue: [ ^ self ].
	nodeString := node strings first.
	(#('No universal currency') includes: nodeString)
		ifFalse: [ newCurrency perform: aSymbol with: nodeString ]
]

{ #category : #currencies }
Currency class >> swissFranc [
	^ self currencies detect: [ :each | each country = 'SWITZERLAND' and: [ each currencyCode = 'CHF' ] ]
]

{ #category : #updating }
Currency class >> updateCurrencies [
	self
		initializeCurrencies;
		setConvertableCurrenciesAndRates
]

{ #category : #currencies }
Currency class >> usDollar [
	^ self currencies
		detect: [ :each | 
			each currencyCode = 'USD'
				and: [ each country = 'UNITED STATES' or: [ each country = 'UNITED STATES OF AMERICA (THE)' ] ] ]
]

{ #category : #currencies }
Currency class >> yen [
	^ self currencies detect: [ :each | each numericCode = 392 ]
]

{ #category : #comparing }
Currency >> <= aCurrency [
	^ self country <= aCurrency country
]

{ #category : #comparing }
Currency >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ numericCode = anObject numericCode and: [ country = anObject country ]
]

{ #category : #accessing }
Currency >> conversionRateToUSD [
	^ conversionRateToUSD
]

{ #category : #accessing }
Currency >> conversionRateToUSD: anObject [
	conversionRateToUSD := anObject
]

{ #category : #accessing }
Currency >> country [
	^ country
]

{ #category : #accessing }
Currency >> country: anObject [
	country := anObject
]

{ #category : #accessing }
Currency >> countryAndSymbolString [
	^ String
		streamContents: [ :s | 
			s
				nextPutAll: self country;
				nextPutAll: ' (';
				nextPutAll: self symbol;
				nextPutAll: ')' ]
]

{ #category : #accessing }
Currency >> currency [
	^ currency ifNil:[currency:=String new]
]

{ #category : #accessing }
Currency >> currency: anObject [
	currency := anObject
]

{ #category : #accessing }
Currency >> currencyCode [
	^ self currency
]

{ #category : #accessing }
Currency >> currencyName [
	^ currencyName ifNil:[self country]
]

{ #category : #accessing }
Currency >> currencyName: anObject [
	currencyName := anObject
]

{ #category : #comparing }
Currency >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ numericCode hash bitXor: country hash
]

{ #category : #accessing }
Currency >> isConvertable [
	^ self conversionRateToUSD ~= 0
]

{ #category : #accessing }
Currency >> minorUnit [
	^ minorUnit
]

{ #category : #accessing }
Currency >> minorUnit: anObject [
	minorUnit := anObject
]

{ #category : #accessing }
Currency >> numericCode [
	^ numericCode
]

{ #category : #accessing }
Currency >> numericCode: anObject [
|number|
number:= [ anObject asInteger ]on:Error do:[nil] .

numericCode := number
]

{ #category : #accessing }
Currency >> printOn: aStream [
	aStream
		nextPutAll: self currencyName.
]

{ #category : #accessing }
Currency >> renderOn: html [
	html render: self country.
	html render: ' ('.
	html render: self symbol.
	html render: ')'
]

{ #category : #accessing }
Currency >> setSymbol [
	symbol := self class currencyCodesAndSymbols at: self currencyCode ifAbsentPut: [String new]
]

{ #category : #accessing }
Currency >> symbol [
	^ symbol
]

{ #category : #accessing }
Currency >> symbol: anObject [
	symbol := anObject
]
