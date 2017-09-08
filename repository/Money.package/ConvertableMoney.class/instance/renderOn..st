comparing
renderOn: html
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