accessing
renderOn: html
	html render: self country.
	html render: ' ('.
	html render: self symbol.
	html render: ')'