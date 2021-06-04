Class {
	#name : #FASTPharoByteArrayLiteral,
	#superclass : #FASTPharoEntity,
	#traits : 'FASTTLiteral',
	#classTraits : 'FASTTLiteral classTrait',
	#category : #'FAST-Pharo-Model-Entities'
}

{ #category : #meta }
FASTPharoByteArrayLiteral class >> annotation [

	<FMClass: #ByteArrayLiteral super: #FASTPharoEntity>
	<package: #'FAST-Pharo-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTPharoByteArrayLiteral >> addContent: anObject [
	<generated>
	^ self contents add: anObject
]

{ #category : #accessing }
FASTPharoByteArrayLiteral >> contents [
	"Relation named: #contents type: #FASTTExpression opposite: #pharoByteArrayLiteralExpressionExpressionOwner"

	<generated>
	<FMComment: 'The expression in the array'>
	<derived>
	<FMProperty: #contents type: #FASTTExpression opposite: #pharoByteArrayLiteralExpressionExpressionOwner>
	^ self attributeAt: #contents ifAbsentPut: [ FMMultivalueLink on: self opposite: #pharoByteArrayLiteralExpressionExpressionOwner: ]
]

{ #category : #accessing }
FASTPharoByteArrayLiteral >> contents: anObject [

	<generated>
	self contents value: anObject
]

{ #category : #navigation }
FASTPharoByteArrayLiteral >> contentsGroup [
	<generated>
	<navigation: 'Contents'>
	^ MooseSpecializedGroup withAll: self contents asSet
]
