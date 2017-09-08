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
						script:(html jQuery this text: (JSStream on:'Number.toLocaleString($(this).text()).values'));
						with: (self amount printShowingDecimalPlaces: 2) ]