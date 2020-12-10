Class {
	#name : #AIStandardizationNormalizer,
	#superclass : #AINormalizer,
	#category : #'AI-Normalization'
}

{ #category : #running }
AIStandardizationNormalizer class >> normalize: aCollection [
	| mean std |
	
	mean := aCollection average.
	std := aCollection stdev.
	
	^ aCollection collect: [ :each |
		(each - mean) / std ]
]
