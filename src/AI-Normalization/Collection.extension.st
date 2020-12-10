Extension { #name : #Collection }

{ #category : #'*AI-Normalization' }
Collection class >> defaultNormalizer [
	^ AIMinMaxNormalizer
]

{ #category : #'*AI-Normalization' }
Collection >> normalized [
	"Normalize the numeric collection using the default normalizer"
	^ self normalizedUsing: self class defaultNormalizer
]

{ #category : #'*AI-Normalization' }
Collection >> normalizedUsing: aNormalizer [
	"Normalize the numeric collection using the given normalizer"
	^ aNormalizer normalize: self
]

{ #category : #'*AI-Normalization' }
Collection >> rescaled [
	"Transform all numbers in the collection to a scale of [0, 1]"
	^ self normalizedUsing: AIMinMaxNormalizer
]

{ #category : #'*AI-Normalization' }
Collection >> standardized [
	"Scale all numbers in the collection to be centered around the mean with a unit standard deviation"
	^ self normalizedUsing: AIStandardizationNormalizer
]
