Class {
	#name : #AIMinMaxNormalizer,
	#superclass : #AINormalizer,
	#category : #'AI-Normalization'
}

{ #category : #running }
AIMinMaxNormalizer class >> normalize: aCollection [
	| min max |
	
	min := aCollection min.
	max := aCollection max.
	
	^ aCollection collect: [ :each |
		(each - min) / (max - min) ]
]
