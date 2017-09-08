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
						script:
								((html jQuery id: html lastId)
										text: (JSStream on: 'Number.parseFloat($("#' , html lastId , '").text()).toLocaleString()'));
						with: (self amount printShowingDecimalPlaces: 2) ]