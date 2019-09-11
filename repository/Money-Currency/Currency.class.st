"
An object to store information and collect conversion rates for currencies from google.com and calculate the cross rates among all convertable currencies.  


Uses the list of the currencies from http://en.wikipedia.org/wiki/List_of_circulating_currencies as of 10-21-2009 as the base list.

Rates are from google.com.  They may not be accurate.  See: http://www.google.com/intl/en/help/currency_disclaimer.html

"
Class {
	#name : #Currency,
	#superclass : #Object,
	#instVars : [
		'currency',
		'symbol',
		'country',
		'currencyName'
	],
	#classVars : [
		'ConvertableCurrencies',
		'CurrenciesUpdated'
	],
	#category : 'Money-Currency'
}

{ #category : #'as yet unclassified' }
Currency class >> ConvertableCurrencies [
	^ConvertableCurrencies
]

{ #category : #'as yet unclassified' }
Currency class >> ConvertableCurrencies: anOrderedCollection [
	ConvertableCurrencies:=anOrderedCollection 
]

{ #category : #'as yet unclassified' }
Currency class >> Currencies [
	|tmp|
	tmp := OrderedCollection  new.
	tmp addAll: self CurrenciesAtoF.
	tmp addAll: self CurrenciesGtoM.
	tmp addAll: self CurrenciesNtoS.
	tmp addAll: self CurrenciesTtoZ.
	^tmp.
]

{ #category : #'as yet unclassified' }
Currency class >> CurrenciesAtoF [
	|tmp|
	tmp := OrderedCollection  new.
tmp add: (self new country: 'Abkhazia'; currencyName: 'Georgian lari'; symbol: 'ლ'; currency: 'GEL').
tmp add: (self new country: 'Afghanistan'; currencyName: 'Afghan afghani'; symbol: '؋'; currency: 'AFN').
tmp add: (self new country: 'Akrotiri and Dhekelia'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Albania'; currencyName: 'Albanian lek'; symbol: 'L'; currency: 'ALL').
tmp add: (self new country: 'Alderney'; currencyName: 'British pound[C]'; symbol: '£'; currency: 'GBP').
tmp add: (self new country: 'Algeria'; currencyName: 'Algerian dinar'; symbol: 'د.ج'; currency: 'DZD').
tmp add: (self new country: 'Andorra'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Angola'; currencyName: 'Angolan kwanza'; symbol: 'Kz'; currency: 'AOA').
tmp add: (self new country: 'Anguilla'; currencyName: 'East Caribbean dollar'; symbol: '$'; currency: 'XCD').
tmp add: (self new country: 'Antigua and Barbuda'; currencyName: 'East Caribbean dollar'; symbol: '$'; currency: 'XCD').
tmp add: (self new country: 'Argentina'; currencyName: 'Argentine peso'; symbol: '$'; currency: 'ARS').
tmp add: (self new country: 'Armenia'; currencyName: 'Armenian dram'; symbol: 'դր.'; currency: 'AMD').
tmp add: (self new country: 'Aruba'; currencyName: 'Aruban florin'; symbol: 'ƒ'; currency: 'AWG').
tmp add: (self new country: 'Ascension Island'; currencyName: 'Saint Helena pound'; symbol: '£'; currency: 'SHP').
tmp add: (self new country: 'Australia'; currencyName: 'Australian dollar'; symbol: '$'; currency: 'AUD').
tmp add: (self new country: 'Austria'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Azerbaijan'; currencyName: 'Azerbaijani manat'; symbol: ' '; currency: 'AZN').
tmp add: (self new country: 'Bahamas, The'; currencyName: 'Bahamian dollar'; symbol: '$'; currency: 'BSD').
tmp add: (self new country: 'Bahrain'; currencyName: 'Bahraini dinar'; symbol: 'ب.د'; currency: 'BHD').
tmp add: (self new country: 'Bangladesh'; currencyName: 'Bangladeshi taka'; symbol: '৳'; currency: 'BDT').
tmp add: (self new country: 'Barbados'; currencyName: 'Barbadian dollar'; symbol: '$'; currency: 'BBD').
tmp add: (self new country: 'Belarus'; currencyName: 'Belarusian ruble'; symbol: 'Br'; currency: 'BYR').
tmp add: (self new country: 'Belgium'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Belize'; currencyName: 'Belize dollar'; symbol: '$'; currency: 'BZD').
tmp add: (self new country: 'Benin'; currencyName: 'West African CFA franc'; symbol: 'Fr'; currency: 'XOF').
tmp add: (self new country: 'Bermuda'; currencyName: 'Bermudian dollar'; symbol: '$'; currency: 'BMD').
tmp add: (self new country: 'Bhutan'; currencyName: 'Bhutanese ngultrum'; symbol: ''; currency: 'BTN').
tmp add: (self new country: 'Bolivia'; currencyName: 'Bolivian boliviano'; symbol: 'Bs.'; currency: 'BOB').
tmp add: (self new country: 'Bosnia and Herzegovina'; currencyName: 'Bosnia and Herzegovina convertible mark'; symbol: 'KM or КМ'; currency: 'BAM').
tmp add: (self new country: 'Botswana'; currencyName: 'Botswana pula'; symbol: 'P'; currency: 'BWP').
tmp add: (self new country: 'Brazil'; currencyName: 'Brazilian real'; symbol: 'R$'; currency: 'BRL').
tmp add: (self new country: 'British Indian Ocean Territory'; currencyName: 'United States dollar[4]'; symbol: '$'; currency: 'USD').
tmp add: (self new country: 'British Virgin Islands'; currencyName: 'United States dollar'; symbol: '$'; currency: 'USD').
tmp add: (self new country: 'Brunei'; currencyName: 'Brunei dollar'; symbol: '$'; currency: 'BND').
tmp add: (self new country: 'Bulgaria'; currencyName: 'Bulgarian lev'; symbol: 'лв'; currency: 'BGN').
tmp add: (self new country: 'Burkina Faso'; currencyName: 'West African CFA franc'; symbol: 'Fr'; currency: 'XOF').
tmp add: (self new country: 'Burundi'; currencyName: 'Burundian franc'; symbol: 'Fr'; currency: 'BIF').
tmp add: (self new country: 'Cambodia'; currencyName: 'Cambodian riel'; symbol: '៛'; currency: 'KHR').
tmp add: (self new country: 'Cameroon'; currencyName: 'Central African CFA franc'; symbol: 'Fr'; currency: 'XAF').
tmp add: (self new country: 'Canada'; currencyName: 'Canadian dollar'; symbol: '$'; currency: 'CAD').
tmp add: (self new country: 'Cape Verde'; currencyName: 'Cape Verdean escudo'; symbol: '$ or Esc'; currency: 'CVE').
tmp add: (self new country: 'Cayman Islands'; currencyName: 'Cayman Islands dollar'; symbol: '$'; currency: 'KYD').
tmp add: (self new country: 'Central African Republic'; currencyName: 'Central African CFA franc'; symbol: 'Fr'; currency: 'XAF').
tmp add: (self new country: 'Chad'; currencyName: 'Central African CFA franc'; symbol: 'Fr'; currency: 'XAF').
tmp add: (self new country: 'Chile'; currencyName: 'Chilean peso'; symbol: '$'; currency: 'CLP').
tmp add: (self new country: 'China, People’s Republic of'; currencyName: 'Chinese yuan'; symbol: '元'; currency: 'CNY').
tmp add: (self new country: 'Cocos (Keeling) Islands'; currencyName: 'Australian dollar'; symbol: '$'; currency: 'AUD').
tmp add: (self new country: 'Colombia'; currencyName: 'Colombian peso'; symbol: '$'; currency: 'COP').
tmp add: (self new country: 'Comoros'; currencyName: 'Comorian franc'; symbol: 'Fr'; currency: 'KMF').
tmp add: (self new country: 'Congo, Democratic Republic of the'; currencyName: 'Congolese franc'; symbol: 'Fr'; currency: 'CDF').
tmp add: (self new country: 'Congo, Republic of the'; currencyName: 'Central African CFA franc'; symbol: 'Fr'; currency: 'XAF').
tmp add: (self new country: 'Cook Islands'; currencyName: 'New Zealand dollar'; symbol: '$'; currency: 'NZD').
tmp add: (self new country: 'Costa Rica'; currencyName: 'Costa Rican colón'; symbol: '₡'; currency: 'CRC').
tmp add: (self new country: 'Côte d’Ivoire'; currencyName: 'West African CFA franc'; symbol: 'Fr'; currency: 'XOF').
tmp add: (self new country: 'Croatia'; currencyName: 'Croatian kuna'; symbol: 'kn'; currency: 'HRK').
tmp add: (self new country: 'Cuba'; currencyName: 'Cuban convertible peso'; symbol: '$'; currency: 'CUC').
tmp add: (self new country: 'Cuba'; currencyName: 'Cuban peso'; symbol: '$'; currency: 'CUP').
tmp add: (self new country: 'Cyprus'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Czech Republic'; currencyName: 'Czech koruna'; symbol: 'Kč'; currency: 'CZK').
tmp add: (self new country: 'Denmark'; currencyName: 'Danish krone'; symbol: 'kr'; currency: 'DKK').
tmp add: (self new country: 'Djibouti'; currencyName: 'Djiboutian franc'; symbol: 'Fr'; currency: 'DJF').
tmp add: (self new country: 'Dominica'; currencyName: 'East Caribbean dollar'; symbol: '$'; currency: 'XCD').
tmp add: (self new country: 'Dominican Republic'; currencyName: 'Dominican peso'; symbol: '$'; currency: 'DOP').
tmp add: (self new country: 'East Timor'; currencyName: 'United States dollar'; symbol: '$'; currency: 'USD').
tmp add: (self new country: 'Ecuador'; currencyName: 'United States dollar'; symbol: '$'; currency: 'USD').
tmp add: (self new country: 'Egypt'; currencyName: 'Egyptian pound'; symbol: '£ or ج.م'; currency: 'EGP').
tmp add: (self new country: 'El Salvador'; currencyName: 'Salvadoran colón'; symbol: '₡'; currency: 'SVC').
tmp add: (self new country: 'Equatorial Guinea'; currencyName: 'Central African CFA franc'; symbol: 'Fr'; currency: 'XAF').
tmp add: (self new country: 'Eritrea'; currencyName: 'Eritrean nakfa'; symbol: 'Nfk'; currency: 'ERN').
tmp add: (self new country: 'Estonia'; currencyName: 'Estonian kroon'; symbol: 'KR'; currency: 'EEK').
tmp add: (self new country: 'Ethiopia'; currencyName: 'Ethiopian birr'; symbol: ''; currency: 'ETB').
tmp add: (self new country: 'Falkland Islands'; currencyName: 'Falkland Islands pound'; symbol: '£'; currency: 'FKP').
tmp add: (self new country: 'Faroe Islands'; currencyName: 'Danish krone'; symbol: 'kr'; currency: 'DKK').
tmp add: (self new country: 'Fiji'; currencyName: 'Fijian dollar'; symbol: '$'; currency: 'FJD').
tmp add: (self new country: 'Finland'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'France'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'French Polynesia'; currencyName: 'CFP franc'; symbol: 'Fr'; currency: 'XPF').

^tmp. 	
]

{ #category : #'as yet unclassified' }
Currency class >> CurrenciesGtoM [
	|tmp|
	tmp := OrderedCollection  new.
tmp add: (self new country: 'Gabon'; currencyName: 'Central African CFA franc'; symbol: 'Fr'; currency: 'XAF').
tmp add: (self new country: 'Gambia, The'; currencyName: 'Gambian dalasi'; symbol: 'D'; currency: 'GMD').
tmp add: (self new country: 'Georgia'; currencyName: 'Georgian lari'; symbol: 'ლ'; currency: 'GEL').
tmp add: (self new country: 'Germany'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Ghana'; currencyName: 'Ghanaian cedi'; symbol: '₵'; currency: 'GHS').
tmp add: (self new country: 'Gibraltar'; currencyName: 'Gibraltar pound'; symbol: '£'; currency: 'GIP').
tmp add: (self new country: 'Greece'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Grenada'; currencyName: 'East Caribbean dollar'; symbol: '$'; currency: 'XCD').
tmp add: (self new country: 'Guatemala'; currencyName: 'Guatemalan quetzal'; symbol: 'Q'; currency: 'GTQ').
tmp add: (self new country: 'Guernsey'; currencyName: 'British pound[C]'; symbol: '£'; currency: 'GBP').
tmp add: (self new country: 'Guinea'; currencyName: 'Guinean franc'; symbol: 'Fr'; currency: 'GNF').
tmp add: (self new country: 'Guinea-Bissau'; currencyName: 'West African CFA franc'; symbol: 'Fr'; currency: 'XOF').
tmp add: (self new country: 'Guyana'; currencyName: 'Guyanese dollar'; symbol: '$'; currency: 'GYD').
tmp add: (self new country: 'Haiti'; currencyName: 'Haitian gourde'; symbol: 'G'; currency: 'HTG').
tmp add: (self new country: 'Honduras'; currencyName: 'Honduran lempira'; symbol: 'L'; currency: 'HNL').
tmp add: (self new country: 'Hong Kong'; currencyName: 'Hong Kong dollar'; symbol: '$'; currency: 'HKD').
tmp add: (self new country: 'Hungary'; currencyName: 'Hungarian forint'; symbol: 'Ft'; currency: 'HUF').
tmp add: (self new country: 'Iceland'; currencyName: 'Icelandic króna'; symbol: 'kr'; currency: 'ISK').
tmp add: (self new country: 'India'; currencyName: 'Indian rupee'; symbol: 'Rs'; currency: 'INR').
tmp add: (self new country: 'Indonesia'; currencyName: 'Indonesian rupiah'; symbol: 'Rp'; currency: 'IDR').
tmp add: (self new country: 'Iran'; currencyName: 'Iranian rial'; symbol: '﷼'; currency: 'IRR').
tmp add: (self new country: 'Iraq'; currencyName: 'Iraqi dinar'; symbol: 'ع.د'; currency: 'IQD').
tmp add: (self new country: 'Ireland'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Isle of Man'; currencyName: 'British pound[C]'; symbol: '£'; currency: 'GBP').
tmp add: (self new country: 'Israel'; currencyName: 'Israeli new sheqel'; symbol: '₪'; currency: 'ILS').
tmp add: (self new country: 'Italy'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Jamaica'; currencyName: 'Jamaican dollar'; symbol: '$'; currency: 'JMD').
tmp add: (self new country: 'Japan'; currencyName: 'Japanese yen'; symbol: '¥'; currency: 'JPY').
tmp add: (self new country: 'Jersey'; currencyName: 'British pound[C]'; symbol: '£'; currency: 'GBP').
tmp add: (self new country: 'Jordan'; currencyName: 'Jordanian dinar'; symbol: 'د.ا'; currency: 'JOD').
tmp add: (self new country: 'Kazakhstan'; currencyName: 'Kazakhstani tenge'; symbol: '〒'; currency: 'KZT').
tmp add: (self new country: 'Kenya'; currencyName: 'Kenyan shilling'; symbol: 'Sh'; currency: 'KES').
tmp add: (self new country: 'Kiribati'; currencyName: 'Australian dollar'; symbol: '$'; currency: 'AUD').
tmp add: (self new country: 'Korea, North'; currencyName: 'North Korean won'; symbol: '₩'; currency: 'KPW').
tmp add: (self new country: 'Korea, South'; currencyName: 'South Korean won'; symbol: '₩'; currency: 'KRW').
tmp add: (self new country: 'Kosovo'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Kuwait'; currencyName: 'Kuwaiti dinar'; symbol: 'د.ك'; currency: 'KWD').
tmp add: (self new country: 'Kyrgyzstan'; currencyName: 'Kyrgyzstani som'; symbol: ''; currency: 'KGS').
tmp add: (self new country: 'Laos'; currencyName: 'Lao kip'; symbol: '₭'; currency: 'LAK').
tmp add: (self new country: 'Latvia'; currencyName: 'Latvian lats'; symbol: 'Ls'; currency: 'LVL').
tmp add: (self new country: 'Lebanon'; currencyName: 'Lebanese pound'; symbol: 'ل.ل'; currency: 'LBP').
tmp add: (self new country: 'Lesotho'; currencyName: 'Lesotho loti'; symbol: 'L'; currency: 'LSL').
tmp add: (self new country: 'Liberia'; currencyName: 'Liberian dollar'; symbol: '$'; currency: 'LRD').
tmp add: (self new country: 'Libya'; currencyName: 'Libyan dinar'; symbol: 'ل.د'; currency: 'LYD').
tmp add: (self new country: 'Liechtenstein'; currencyName: 'Swiss franc'; symbol: 'Fr'; currency: 'CHF').
tmp add: (self new country: 'Lithuania'; currencyName: 'Lithuanian litas'; symbol: 'Lt'; currency: 'LTL').
tmp add: (self new country: 'Luxembourg'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Macau'; currencyName: 'Macanese pataca'; symbol: 'P'; currency: 'MOP').
tmp add: (self new country: 'Macedonia, Republic of'; currencyName: 'Macedonian denar'; symbol: 'ден'; currency: 'MKD').
tmp add: (self new country: 'Madagascar'; currencyName: 'Malagasy ariary'; symbol: ''; currency: 'MGA').
tmp add: (self new country: 'Malawi'; currencyName: 'Malawian kwacha'; symbol: 'MK'; currency: 'MWK').
tmp add: (self new country: 'Malaysia'; currencyName: 'Malaysian ringgit'; symbol: 'RM'; currency: 'MYR').
tmp add: (self new country: 'Maldives'; currencyName: 'Maldivian rufiyaa'; symbol: 'ރ.'; currency: 'MVR').
tmp add: (self new country: 'Mali'; currencyName: 'West African CFA franc'; symbol: 'Fr'; currency: 'XOF').
tmp add: (self new country: 'Malta'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Marshall Islands'; currencyName: 'United States dollar'; symbol: '$'; currency: 'USD').
tmp add: (self new country: 'Mauritania'; currencyName: 'Mauritanian ouguiya'; symbol: 'UM'; currency: 'MRO').
tmp add: (self new country: 'Mauritius'; currencyName: 'Mauritian rupee'; symbol: '₨'; currency: 'MUR').
tmp add: (self new country: 'Mexico'; currencyName: 'Mexican peso'; symbol: '$'; currency: 'MXN').
tmp add: (self new country: 'Micronesia'; currencyName: 'United States dollar'; symbol: '$'; currency: 'USD').
tmp add: (self new country: 'Moldova'; currencyName: 'Moldovan leu'; symbol: 'L'; currency: 'MDL').
tmp add: (self new country: 'Monaco'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Mongolia'; currencyName: 'Mongolian tögrög'; symbol: '₮'; currency: 'MNT').
tmp add: (self new country: 'Montenegro'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Montserrat'; currencyName: 'East Caribbean dollar'; symbol: '$'; currency: 'XCD').
tmp add: (self new country: 'Morocco'; currencyName: 'Moroccan dirham'; symbol: 'د.م.'; currency: 'MAD').
tmp add: (self new country: 'Mozambique'; currencyName: 'Mozambican metical'; symbol: 'MTn'; currency: 'MZN').
tmp add: (self new country: 'Myanmar'; currencyName: 'Myanma kyat'; symbol: 'K'; currency: 'MMK').


^tmp. 	
]

{ #category : #'as yet unclassified' }
Currency class >> CurrenciesNtoS [
	|tmp|
	tmp := OrderedCollection  new.
	tmp add: (self new country: 'Nagorno-Karabakh'; currencyName: 'Armenian dram'; symbol: 'դր.'; currency: 'AMD').
tmp add: (self new country: 'Namibia'; currencyName: 'Namibian dollar'; symbol: '$'; currency: 'NAD').
tmp add: (self new country: 'Nauru'; currencyName: 'Australian dollar'; symbol: '$'; currency: 'AUD').
tmp add: (self new country: 'Nepal'; currencyName: 'Nepalese rupee'; symbol: '₨'; currency: 'NPR').
tmp add: (self new country: 'Netherlands'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Netherlands Antilles'; currencyName: 'Netherlands Antillean guilder'; symbol: 'ƒ'; currency: 'ANG').
tmp add: (self new country: 'New Caledonia'; currencyName: 'CFP franc'; symbol: 'Fr'; currency: 'XPF').
tmp add: (self new country: 'New Zealand'; currencyName: 'New Zealand dollar'; symbol: '$'; currency: 'NZD').
tmp add: (self new country: 'Nicaragua'; currencyName: 'Nicaraguan córdoba'; symbol: 'C$'; currency: 'NIO').
tmp add: (self new country: 'Niger'; currencyName: 'West African CFA franc'; symbol: 'Fr'; currency: 'XOF').
tmp add: (self new country: 'Nigeria'; currencyName: 'Nigerian naira'; symbol: '₦'; currency: 'NGN').
tmp add: (self new country: 'Niue'; currencyName: 'New Zealand dollar'; symbol: '$'; currency: 'NZD').
tmp add: (self new country: 'Northern Cyprus'; currencyName: 'Turkish lira'; symbol: '₤'; currency: 'TRY').
tmp add: (self new country: 'Northern Mariana Islands'; currencyName: 'United States dollar'; symbol: '$'; currency: 'USD').
tmp add: (self new country: 'Norway'; currencyName: 'Norwegian krone'; symbol: 'kr'; currency: 'NOK').
tmp add: (self new country: 'Oman'; currencyName: 'Omani rial'; symbol: 'ر.ع.'; currency: 'OMR').
tmp add: (self new country: 'Pakistan'; currencyName: 'Pakistani rupee'; symbol: '₨'; currency: 'PKR').
tmp add: (self new country: 'Palau'; currencyName: 'Palauan dollar[A]'; symbol: '$'; currency: 'None').
tmp add: (self new country: 'Palestine'; currencyName: 'Israeli new sheqel'; symbol: '₪'; currency: 'ILS').
tmp add: (self new country: 'Panama'; currencyName: 'Panamanian balboa'; symbol: 'B/.'; currency: 'PAB').
tmp add: (self new country: 'Papua New Guinea'; currencyName: 'Papua New Guinean kina'; symbol: 'K'; currency: 'PGK').
tmp add: (self new country: 'Paraguay'; currencyName: 'Paraguayan guaraní'; symbol: '₲'; currency: 'PYG').
tmp add: (self new country: 'Peru'; currencyName: 'Peruvian nuevo sol'; symbol: 'S/.'; currency: 'PEN').
tmp add: (self new country: 'Philippines'; currencyName: 'Philippine peso'; symbol: '₱'; currency: 'PHP').
tmp add: (self new country: 'Pitcairn Islands'; currencyName: 'New Zealand dollar'; symbol: '$'; currency: 'NZD').
tmp add: (self new country: 'Poland'; currencyName: 'Polish złoty'; symbol: 'zł'; currency: 'PLN').
tmp add: (self new country: 'Portugal'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Qatar'; currencyName: 'Qatari riyal'; symbol: 'ر.ق'; currency: 'QAR').
tmp add: (self new country: 'Romania'; currencyName: 'Romanian leu'; symbol: 'L'; currency: 'RON').
tmp add: (self new country: 'Russia'; currencyName: 'Russian ruble'; symbol: 'руб.'; currency: 'RUB').
tmp add: (self new country: 'Rwanda'; currencyName: 'Rwandan franc'; symbol: 'Fr'; currency: 'RWF').
tmp add: (self new country: 'Saint Helena'; currencyName: 'Saint Helena pound'; symbol: '£'; currency: 'SHP').
tmp add: (self new country: 'Saint Kitts and Nevis'; currencyName: 'East Caribbean dollar'; symbol: '$'; currency: 'XCD').
tmp add: (self new country: 'Saint Lucia'; currencyName: 'East Caribbean dollar'; symbol: '$'; currency: 'XCD').
tmp add: (self new country: 'Saint Vincent and the Grenadines'; currencyName: 'East Caribbean dollar'; symbol: '$'; currency: 'XCD').
tmp add: (self new country: 'Samoa'; currencyName: 'Samoan tala'; symbol: 'T'; currency: 'WST').
tmp add: (self new country: 'San Marino'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'São Tomé and Príncipe'; currencyName: 'São Tomé and Príncipe dobra'; symbol: 'Db'; currency: 'STD').
tmp add: (self new country: 'Saudi Arabia'; currencyName: 'Saudi riyal'; symbol: 'ر.س'; currency: 'SAR').
tmp add: (self new country: 'Senegal'; currencyName: 'West African CFA franc'; symbol: 'Fr'; currency: 'XOF').
tmp add: (self new country: 'Serbia'; currencyName: 'Serbian dinar'; symbol: 'дин. or din.'; currency: 'RSD').
tmp add: (self new country: 'Seychelles'; currencyName: 'Seychellois rupee'; symbol: '₨'; currency: 'SCR').
tmp add: (self new country: 'Sierra Leone'; currencyName: 'Sierra Leonean leone'; symbol: 'Le'; currency: 'SLL').
tmp add: (self new country: 'Singapore'; currencyName: 'Singapore dollar'; symbol: '$'; currency: 'SGD').
tmp add: (self new country: 'Slovakia'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Slovenia'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Solomon Islands'; currencyName: 'Solomon Islands dollar'; symbol: '$'; currency: 'SBD').
tmp add: (self new country: 'Somalia'; currencyName: 'Somali shilling'; symbol: 'Sh'; currency: 'SOS').
tmp add: (self new country: 'Somaliland'; currencyName: 'Somaliland shilling'; symbol: 'Sh'; currency: 'None').
tmp add: (self new country: 'South Africa'; currencyName: 'South African rand'; symbol: 'R'; currency: 'ZAR').
tmp add: (self new country: 'South Georgia and the South Sandwich Islands'; currencyName: 'British pound'; symbol: '£'; currency: 'GBP').
tmp add: (self new country: 'South Ossetia'; currencyName: 'Georgian lari'; symbol: 'ლ'; currency: 'GEL').
tmp add: (self new country: 'Spain'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Sri Lanka'; currencyName: 'Sri Lankan rupee'; symbol: 'Rs'; currency: 'LKR').
tmp add: (self new country: 'Sudan'; currencyName: 'Sudanese pound'; symbol: '£'; currency: 'SDG').
tmp add: (self new country: 'Suriname'; currencyName: 'Surinamese dollar'; symbol: '$'; currency: 'SRD').
tmp add: (self new country: 'Swaziland'; currencyName: 'Swazi lilangeni'; symbol: 'L'; currency: 'SZL').
tmp add: (self new country: 'Sweden'; currencyName: 'Swedish krona'; symbol: 'kr'; currency: 'SEK').
tmp add: (self new country: 'Switzerland'; currencyName: 'Swiss franc'; symbol: 'Fr'; currency: 'CHF').
tmp add: (self new country: 'Syria'; currencyName: 'Syrian pound'; symbol: '£ or ل.س'; currency: 'SYP').

^tmp.
]

{ #category : #'as yet unclassified' }
Currency class >> CurrenciesTtoZ [
	|tmp|
	tmp := OrderedCollection  new.
	tmp add: (self new country: 'Taiwan (Republic of China)'; currencyName: 'New Taiwan dollar'; symbol: '$'; currency: 'TWD').
tmp add: (self new country: 'Tajikistan'; currencyName: 'Tajikistani somoni'; symbol: 'ЅМ'; currency: 'TJS').
tmp add: (self new country: 'Tanzania'; currencyName: 'Tanzanian shilling'; symbol: 'Sh'; currency: 'TZS').
tmp add: (self new country: 'Thailand'; currencyName: 'Thai baht'; symbol: '฿'; currency: 'THB').
tmp add: (self new country: 'Togo'; currencyName: 'West African CFA franc'; symbol: 'Fr'; currency: 'XOF').
tmp add: (self new country: 'Tonga'; currencyName: 'Tongan paʻanga'; symbol: 'T$'; currency: 'TOP').
tmp add: (self new country: 'Trinidad and Tobago'; currencyName: 'Trinidad and Tobago dollar'; symbol: '$'; currency: 'TTD').
tmp add: (self new country: 'Tristan da Cunha'; currencyName: 'Saint Helena pound'; symbol: '£'; currency: 'SHP').
tmp add: (self new country: 'Tunisia'; currencyName: 'Tunisian dinar'; symbol: 'د.ت'; currency: 'TND').
tmp add: (self new country: 'Turkey'; currencyName: 'Turkish lira'; symbol: 'TL'; currency: 'TRY').
tmp add: (self new country: 'Turkmenistan'; currencyName: 'Turkmenistani manat'; symbol: 'm'; currency: 'TMM').
tmp add: (self new country: 'Turks and Caicos Islands'; currencyName: 'United States dollar'; symbol: '$'; currency: 'USD').
tmp add: (self new country: 'Tuvalu'; currencyName: 'Australian dollar'; symbol: '$'; currency: 'AUD').
tmp add: (self new country: 'Uganda'; currencyName: 'Ugandan shilling'; symbol: 'Sh'; currency: 'UGX').
tmp add: (self new country: 'Ukraine'; currencyName: 'Ukrainian hryvnia'; symbol: '₴'; currency: 'UAH').
tmp add: (self new country: 'United Arab Emirates'; currencyName: 'United Arab Emirates dirham'; symbol: 'د.إ'; currency: 'AED').
tmp add: (self new country: 'United Kingdom'; currencyName: 'British pound[C]'; symbol: '£'; currency: 'GBP').
tmp add: (self new country: 'United States'; currencyName: 'United States dollar'; symbol: '$'; currency: 'USD').
tmp add: (self new country: 'Uruguay'; currencyName: 'Uruguayan peso'; symbol: '$'; currency: 'UYU').
tmp add: (self new country: 'Uzbekistan'; currencyName: 'Uzbekistani som'; symbol: ''; currency: 'UZS').
tmp add: (self new country: 'Vanuatu'; currencyName: 'Vanuatu vatu'; symbol: 'Vt'; currency: 'VUV').
tmp add: (self new country: 'Vatican City'; currencyName: 'Euro'; symbol: '€'; currency: 'EUR').
tmp add: (self new country: 'Venezuela'; currencyName: 'Venezuelan bolívar'; symbol: 'Bs F'; currency: 'VEF').
tmp add: (self new country: 'Vietnam'; currencyName: 'Vietnamese đồng'; symbol: '₫'; currency: 'VND').
tmp add: (self new country: 'Wallis and Futuna'; currencyName: 'CFP franc'; symbol: 'Fr'; currency: 'XPF').
tmp add: (self new country: 'Western Sahara'; currencyName: 'Moroccan dirham'; symbol: 'د.م.'; currency: 'MAD').
tmp add: (self new country: 'Yemen'; currencyName: 'Yemeni rial'; symbol: '﷼'; currency: 'YER').
tmp add: (self new country: 'Zambia'; currencyName: 'Zambian kwacha'; symbol: 'ZK'; currency: 'ZMK').
tmp add: (self new country: 'Zimbabwe'; currencyName: 'Zimbabwean dollar'; symbol: '$'; currency: 'ZWR').
^tmp.
]

{ #category : #'as yet unclassified' }
Currency class >> CurrenciesUpdated [
	^CurrenciesUpdated
]

{ #category : #'as yet unclassified' }
Currency class >> CurrenciesUpdated: aDateAndTime [
	CurrenciesUpdated := aDateAndTime 
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
Currency >> currency [
	^ currency
]

{ #category : #accessing }
Currency >> currency: anObject [
	currency := anObject
]

{ #category : #accessing }
Currency >> currencyName [
	^ currencyName
]

{ #category : #accessing }
Currency >> currencyName: anObject [
	currencyName := anObject
]

{ #category : #accessing }
Currency >> setConvertableCurrencies [

|response first aMoney availableCurrencies convertableCurrencies tmp|
aMoney := Money amount: 1 currency: 'USD'.
availableCurrencies := Currency Currencies collect: [:each | each currency].

tmp := availableCurrencies collect: [:each|	response := Curl new getContentsUrl: 'http://www.google.com/search?&q=1.00+' , aMoney currency , '+in+' , each.
	first := response findString: 'h2 class=r' startingAt: 0.
	first=0 ifFalse:[each]].
convertableCurrencies := tmp select: [:each | each notNil ] .
Currency ConvertableCurrencies: convertableCurrencies .
^convertableCurrencies.
]

{ #category : #accessing }
Currency >> setConvertableCurrenciesAndRates [

|response first second availableCurrencies convertableCurrencies tmp tmp1 rate|
convertableCurrencies := Dictionary new.
availableCurrencies := Currency Currencies collect: [:each | each currency].

availableCurrencies do: [:each|	response := Curl new getContentsUrl: 'http://www.google.com/search?&q=1.00+USD+in+' , each.
		
	first := response findString: 'h2 class=r' startingAt: 0.
	first=0 ifFalse:[second := response findString: 'h2' startingAt: (first +1).

						tmp1 := response copyFrom: first to: second.
						first := tmp1 findString: '= ' startingAt: 0.
						second := tmp1 findString: ' ' startingAt: (first +2).
						rate := (tmp1 copyFrom: first+2 to: second) asNumber.
						convertableCurrencies at: each put: rate]].




 
Currency ConvertableCurrencies: convertableCurrencies.
Currency CurrenciesUpdated: DateAndTime now.
^convertableCurrencies .

]

{ #category : #accessing }
Currency >> symbol [
	^ symbol
]

{ #category : #accessing }
Currency >> symbol: anObject [
	symbol := anObject
]
