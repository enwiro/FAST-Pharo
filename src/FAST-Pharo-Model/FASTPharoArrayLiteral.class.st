Class {
	#name : #FASTPharoArrayLiteral,
	#superclass : #FASTPharoEntity,
	#traits : 'FASTTLiteral',
	#classTraits : 'FASTTLiteral classTrait',
	#category : #'FAST-Pharo-Model-Entities'
}

{ #category : #meta }
FASTPharoArrayLiteral class >> annotation [

	<FMClass: #ArrayLiteral super: #FASTPharoEntity>
	<package: #'FAST-Pharo-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTPharoArrayLiteral >> addContent: anObject [
	<generated>
	^ self contents add: anObject
]

{ #category : #accessing }
FASTPharoArrayLiteral >> contents [
	"Relation named: #contents type: #FASTTExpression opposite: #pharoArrayLiteralExpressionExpressionOwner"

	<generated>
	<FMComment: 'The expression in the array'>
	<derived>
	<FMProperty: #contents type: #FASTTExpression opposite: #pharoArrayLiteralExpressionExpressionOwner>
	^ self attributeAt: #contents ifAbsentPut: [ FMMultivalueLink on: self opposite: #pharoArrayLiteralExpressionExpressionOwner: ]
]

{ #category : #accessing }
FASTPharoArrayLiteral >> contents: anObject [

	<generated>
	self contents value: anObject
]

{ #category : #navigation }
FASTPharoArrayLiteral >> contentsGroup [
	<generated>
	<navigation: 'Contents'>
	^ MooseSpecializedGroup withAll: self contents asSet
]
