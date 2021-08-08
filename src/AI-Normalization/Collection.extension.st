Extension { #name : #Collection }

{ #category : #'*AI-Normalization' }
Collection class >> defaultNormalizerClass [
	^ AIMinMaxNormalizer
]

{ #category : #'*AI-Normalization' }
Collection >> normalized [
	"Normalize the numeric collection using the default normalizer"
	| normalizer |
	normalizer := self class defaultNormalizerClass new.
	^ self normalizedUsing: normalizer.
]

{ #category : #'*AI-Normalization' }
Collection >> normalizedUsing: aNormalizer [
	"Normalize the numeric collection using the given normalizer"
	^ aNormalizer normalize: self
]

{ #category : #'*AI-Normalization' }
Collection >> rescaled [
	"Transform all numbers in the collection to a scale of [0, 1]"
	| normalizer |
	normalizer := AIMinMaxNormalizer new.
	^ self normalizedUsing: normalizer.
]

{ #category : #'*AI-Normalization' }
Collection >> standardized [
	"Scale all numbers in the collection to be centered around the mean with a unit standard deviation"
	| normalizer |
	normalizer := AIStandardizationNormalizer new.
	^ self normalizedUsing: normalizer.
]
