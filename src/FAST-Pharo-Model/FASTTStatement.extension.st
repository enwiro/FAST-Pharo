Extension { #name : #FASTTStatement }

{ #category : #'*FAST-Pharo-Model-accessing' }
FASTTStatement >> pharoBlockStatementOwner [
	"Relation named: #pharoBlockStatementOwner type: #FASTPharoBlockDefinition opposite: #statements"

	<generated>
	<container>
	<FMProperty: #pharoBlockStatementOwner type: #FASTPharoBlockDefinition opposite: #statements>
	<package: #'FAST-Pharo-Model'>
	^ self attributeAt: #pharoBlockStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Pharo-Model-accessing' }
FASTTStatement >> pharoBlockStatementOwner: anObject [

	<generated>
	self attributeAt: #pharoBlockStatementOwner put: (FMMultivalueLink on: self update: #statements from: self pharoBlockStatementOwner to: anObject).
]

{ #category : #'*FAST-Pharo-Model-accessing' }
FASTTStatement >> pharoMethodStatementOwner [
	"Relation named: #pharoMethodStatementOwner type: #FASTPharoMethodEntity opposite: #statements"

	<generated>
	<container>
	<FMProperty: #pharoMethodStatementOwner type: #FASTPharoMethodEntity opposite: #statements>
	<package: #'FAST-Pharo-Model'>
	^ self attributeAt: #pharoMethodStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Pharo-Model-accessing' }
FASTTStatement >> pharoMethodStatementOwner: anObject [

	<generated>
	self attributeAt: #pharoMethodStatementOwner put: (FMMultivalueLink on: self update: #statements from: self pharoMethodStatementOwner to: anObject).
]
