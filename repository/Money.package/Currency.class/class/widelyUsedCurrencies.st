currencies
widelyUsedCurrencies
	| tmp |
	tmp := OrderedCollection new.
	tmp
		add:
			(self new
				country: 'United States';
				currencyName: 'United States dollar';
				symbol: '$';
				currency: 'USD').
	tmp
		add:
			(self new
				country: 'France';
				currencyName: 'Euro';
				symbol: '€';
				currency: 'EUR').
	tmp
		add:
			(self new
				country: 'China, People''s Republic of';
				currencyName: 'Chinese yuan';
				symbol: '元';
				currency: 'CNY').
	tmp
		add:
			(self new
				country: 'United Kingdom';
				currencyName: 'British pound';
				symbol: '£';
				currency: 'GBP').
	tmp
		add:
			(self new
				country: 'Russia';
				currencyName: 'Russian ruble';
				symbol: 'руб.';
				currency: 'RUB').
	tmp
		add:
			(self new
				country: 'Brazil';
				currencyName: 'Brazilian real';
				symbol: 'R$';
				currency: 'BRL').
	tmp
		add:
			(self new
				country: 'Switzerland';
				currencyName: 'Swiss franc';
				symbol: 'Fr';
				currency: 'CHF').
	tmp
		add:
			(self new
				country: 'India';
				currencyName: 'Indian rupee';
				symbol: 'Rs';
				currency: 'INR').
	tmp
		add:
			(self new
				country: 'Japan';
				currencyName: 'Japanese yen';
				symbol: '¥';
				currency: 'JPY').
	^ tmp