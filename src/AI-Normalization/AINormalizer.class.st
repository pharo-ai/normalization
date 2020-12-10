"
I am an abstract class. My subclasses define different ways to normalize a numeric collection.
"
Class {
	#name : #AINormalizer,
	#superclass : #Object,
	#category : #'AI-Normalization'
}

{ #category : #normalization }
AINormalizer class >> normalize: aCollection [
	"Normalize a numeric collection. Subclasses should override this method to define different normalization strategies"
	self subclassResponsibility
]
