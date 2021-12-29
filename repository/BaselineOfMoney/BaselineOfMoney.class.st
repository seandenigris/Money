Class {
	#name : #BaselineOfMoney,
	#superclass : #BaselineOf,
	#category : #BaselineOfMoney
}

{ #category : #baselines }
BaselineOfMoney >> baseline: spec [
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
				"project: 'HTTP-API-Client'
					with: [ 
							spec
								className: 'ConfigurationOfHTTPAPIClient';
								loads: 'Core';
								versionString: #stable;
								repository: 'http://smalltalkhub.com/mc/pdebruic/HTTPAPIClient/main' ];"
				baseline: 'Magritte' with: [ spec repository: 'github://magritte-metamodel/Magritte' ].
			spec
				package: 'Money' with: [ spec requires: #('JSON' "'HTTP-API-Client'") ];
				package: 'Money-Magritte' with: [ spec requires: #('Magritte' 'Money') ].
			spec group: 'Core' with: #('Money') ].
	
	spec for: #notGToolkit do: [
		spec baseline: 'XMLParser' with: [
			spec 
				repository: 'github://pharo-contributions/XML-XMLParser';
				loads: #('Core') ];
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
]

{ #category : #accessing }
BaselineOfMoney >> customProjectAttributes [

	^ self isGTImage
			ifTrue: [ #(GToolkit) ]
			ifFalse: [ #(notGToolkit) ].
			
	"This is just for code generation purposes. To have an effect, it needs to be on the instance-side, but that could hide problems in other baselines because DeNigrisPreferences is not guaranteed to be loaded"
]

{ #category : #testing }
BaselineOfMoney >> isGTImage [
	
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'Lepiter-' ].
	"Implementation note: used to check for GToolkit prefix, but P7 has a GToolkit-Examples package. Lepiter, OTOH, could only be loaded in a GT image"
]
