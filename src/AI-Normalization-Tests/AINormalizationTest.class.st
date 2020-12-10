Class {
	#name : #AINormalizationTest,
	#superclass : #TestCase,
	#instVars : [
		'collection',
		'expectedRescaledCollection',
		'expectedStandardizedCollection'
	],
	#category : #'AI-Normalization-Tests'
}

{ #category : #initialization }
AINormalizationTest >> setUp [
	super setUp.
	collection := #(10 -3 4 2 -7 1000 0.1 -4.05).
	
	expectedRescaledCollection := collection collect: [ :x | (x + 7) / 1007 ].
	expectedStandardizedCollection := collection collect: [ :x | (x - 125.25625) / 353.4890152238519 ]
]

{ #category : #tests }
AINormalizationTest >> testNormalized [
	self assert: collection normalized equals: expectedRescaledCollection
]

{ #category : #tests }
AINormalizationTest >> testNormalizedUsing [
	| standardizedCollection |
	
	standardizedCollection := collection normalizedUsing: AIStandardizationNormalizer.
	
	1 to: collection size do: [ :index |
		self
			assert: (standardizedCollection at: index)
			closeTo: (expectedStandardizedCollection at: index) ].
]

{ #category : #tests }
AINormalizationTest >> testRescaled [
	self assert: collection rescaled equals: expectedRescaledCollection
]

{ #category : #tests }
AINormalizationTest >> testStandardized [
	| standardizedCollection |
	
	standardizedCollection := collection standardized.
	
	1 to: collection size do: [ :index |
		self
			assert: (standardizedCollection at: index)
			closeTo: (expectedStandardizedCollection at: index) ].
]
