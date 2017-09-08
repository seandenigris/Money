as yet unclassified
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				project: 'JSON'
					with: [ 
							spec
								className: 'ConfigurationOfJSON';
								file: 'ConfigurationOfJSON';
								loads: #('default');
								repository: 'http://smalltalkhub.com/mc/PharoExtras/JSON/main' ];
				project: 'HTTP-API-Client'
					with: [ 
							spec
								className: 'ConfigurationOfHTTPAPIClient';
								loads: 'Core';
								versionString: #stable;
								repository: 'http://smalltalkhub.com/mc/pdebruic/HTTPAPIClient/main' ];
				package: 'Money' with: [ spec requires: #('JSON' 'HTTP-API-Client') ].
			spec group: 'Core' with: #('Money') ].
	spec
		for: #squeakCommon
		do: [ 
			spec
				project: 'XMLParser'
					with: [ 
							spec
								className: 'ConfigurationOfXMLParser';
								file: 'ConfigurationOfXMLParser';
								loads: #('Core');
								repository: 'http://www.smalltalkhub.com/mc/PharoExtras/XMLParser/main' ];
				package: 'Money' with: [ spec requires: #('XMLParser') ] ].
	spec
		for: #gemstone
		do: [ 
			spec
				project: 'XMLSupport'
					with: [ 
							spec
								className: 'ConfigurationOfXMLSupport';
								file: 'ConfigurationOfXMLSupport';
								loads: #('Core');
								repository: 'http://www.squeaksource.com/MetacelloRepository' ];
				package: 'Money' with: [ spec requires: #('XMLSupport') ] ]