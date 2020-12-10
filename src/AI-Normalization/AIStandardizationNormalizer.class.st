"
I can normalize the numeric collection by scaling all numbers to be centered around the mean with a unit standard deviation. I do not modify the existing collection but create a new one.

Given a numeric collection $ x = \\{x_i\\}_{i=1}^{n} $, I returned a normalized collection $ x' = \\{x_i'\\}_{i=1}^{n} $ in which each element is defined as

$ x_i' = \\frac{x_i - \\mu}{\\sigma} $

Where $ \\mu $ is a mean value of collection $ x $ and $ \\sigma $ is a standard deviation of $ x $.
"
Class {
	#name : #AIStandardizationNormalizer,
	#superclass : #AINormalizer,
	#category : #'AI-Normalization'
}

{ #category : #normalization }
AIStandardizationNormalizer class >> normalize: aCollection [
	"Normalize the numeric collection by scaling all numbers to be centered around the mean with a unit standard deviation"
	| mean std |
	
	mean := aCollection average.
	std := aCollection stdev.
	
	^ aCollection collect: [ :each |
		(each - mean) / std ]
]
