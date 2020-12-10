Class {
	#name : #BaselineOfAINormalization,
	#superclass : #BaselineOf,
	#category : #BaselineOfAINormalization
}

{ #category : #baselines }
BaselineOfAINormalization >> baseline: spec [
	<baseline>
	spec for: #common do: [	
		"Packages"
		spec 
			package: 'AI-Normalization';
			package: 'AI-Normalization-Tests' with: [ spec requires: #('AI-Normalization') ] ].
]
