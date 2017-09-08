comparing
renderCurrencyLocaleFormattingScriptOn: html
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