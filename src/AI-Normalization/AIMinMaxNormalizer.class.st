"
I can normalize the numeric collection by transforming all numbers to a scale of [0, 1]. I do not modify the existing collection but create a new one.

Given a numeric collection $ x = \\{x_i\\}_{i=1}^{n} $, I returned a normalized collection $ x' = \\{x_i'\\}_{i=1}^{n} $ in which each element is defined as

$ x_i' = \\frac{x_i - x_{min}}{x_{max} - x_{min}} $
"
Class {
	#name : #AIMinMaxNormalizer,
	#superclass : #AINormalizer,
	#category : #'AI-Normalization'
}

{ #category : #normalization }
AIMinMaxNormalizer class >> normalize: aCollection [
	"Normalize the numeric collection by transforming all numbers to a scale of [0, 1]"
	| min max |
	
	min := aCollection min.
	max := aCollection max.
	
	^ aCollection collect: [ :each |
		(each - min) / (max - min) ]
]
