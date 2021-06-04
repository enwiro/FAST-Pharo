"
TODO

- FASTPharoMethodEntity

DONE

- FASTPharoSelector
- FASTPharoSymbolLiteral
- FASTPharoNumberLiteral
- FASTPharoMessageSend
"
Class {
	#name : #FASTPharoMetamodelGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'arrayExpression',
		'arrayLiteral',
		'assignmentExpression',
		'blockDefinition',
		'blockExpression',
		'byteArrayLiteral',
		'cascade',
		'pharoExpression',
		'messageSend',
		'methodEntity',
		'numberLiteral',
		'selector',
		'symbolLiteral',
		'tLiteral',
		'tVariableExpression',
		'tBehaviouralEntity',
		'tExpression',
		'tNamedBehaviouralEntity',
		'tEntity',
		'tStatement'
	],
	#category : #'FAST-Pharo-Model-Generator'
}

{ #category : #accessing }
FASTPharoMetamodelGenerator class >> packageName [

	<ignoreForCoverage>
	^ #'FAST-Pharo-Model'
]

{ #category : #accessing }
FASTPharoMetamodelGenerator class >> prefix [

	<ignoreForCoverage>
	^ #'FASTPharo'
]

{ #category : #accessing }
FASTPharoMetamodelGenerator class >> submetamodels [
	^ { FASTMetamodelGenerator . FamixGenerator }
]

{ #category : #definition }
FASTPharoMetamodelGenerator >> defineClasses [
	super defineClasses.
	arrayExpression := builder newClassNamed: #ArrayExpression.
	arrayLiteral := builder newClassNamed: #ArrayLiteral.
	assignmentExpression := builder newClassNamed: #AssignmentExpression.
	blockDefinition := builder newClassNamed: #BlockDefinition.
	blockExpression := builder newClassNamed: #BlockExpression.
	byteArrayLiteral := builder newClassNamed: #ByteArrayLiteral.
	cascade := builder newClassNamed: #Cascade.
	pharoExpression := builder newClassNamed: #Expression.
	messageSend := builder newClassNamed: #MessageSend.
	methodEntity := builder newClassNamed: #MethodEntity.
	numberLiteral := builder newClassNamed: #NumberLiteral.
	selector := builder newClassNamed: #Selector.
	symbolLiteral := builder newClassNamed: #SymbolLiteral.
]

{ #category : #definition }
FASTPharoMetamodelGenerator >> defineHierarchy [
	super defineHierarchy.
	arrayLiteral --|> tLiteral.
	blockDefinition --|> tBehaviouralEntity.
	byteArrayLiteral --|> tLiteral.
	pharoExpression --|> tExpression.
	arrayExpression --|> pharoExpression.
	assignmentExpression --|> pharoExpression.
	blockExpression --|> pharoExpression.
	cascade --|> pharoExpression.
	messageSend --|> tExpression.
	methodEntity --|> tNamedBehaviouralEntity.
	methodEntity --|> #THasImmediateSource.
	numberLiteral --|> tLiteral.
	selector --|> tEntity.
	selector --|> #TNamedEntity.
	symbolLiteral --|> tLiteral.
	
]

{ #category : #definition }
FASTPharoMetamodelGenerator >> defineProperties [
	super defineProperties.
	(messageSend property: #kind type: #String) comment: 'The kind of message'.
]

{ #category : #definition }
FASTPharoMetamodelGenerator >> defineRelations [
	super defineRelations.
	 
	(((messageSend property: #selector) comment: 'The sent selector') <>- ((selector property: #parentMessageSend) comment: 'The sended of this selector')) withoutPrimaryContainer.
	(((messageSend property: #receiver) comment: 'The receiver of the selector') <>- ((tExpression property: #pharoMessageReceiver) comment: 'The receiver of the pharo message')) withoutPrimaryContainer.
	(((messageSend property: #inCascade) comment: 'Optional cascade including this message') *-<> ((cascade property: #messages) comment: 'The messages of the cascade')) withoutPrimaryContainer.	
	
	(((messageSend property: #arguments) comment: 'The arguments of the message') <>-* ((tExpression property: #pharoMessageArgumentOwner) comment: 'The message which own this argument')) withoutPrimaryContainer.	
	
	(((blockExpression property: #block) comment: 'Behavioural entity that represents the block') <>- ((blockDefinition property: #blockExpression) comment: 'Expression entity that represents the block')) withoutPrimaryContainer.
	
	(((assignmentExpression property: #variable) comment: 'An assigned variable (lhs of assignement)') <>- ((tVariableExpression property: #pharoParentAssignmentExpression) comment: '')) withoutPrimaryContainer.
	(((assignmentExpression property: #expression) comment: 'Assigned expression (rhs of assignement)') <>- ((tExpression property: #pharoParentAssignmentExpression) comment: '')) withoutPrimaryContainer.	
	
	(((methodEntity property: #statements) comment: 'The statements of the method') <>-* ((tStatement property: #pharoMethodStatementOwner) comment: '')) withoutPrimaryContainer.	
	(((methodEntity property: #localVariables) comment: 'The local variables of the method') <>-* ((tVariableExpression property: #pharoMethodVariableEntityOwner) comment: '')) withoutPrimaryContainer.	
	
	
	(((blockDefinition property: #statements) comment: 'The statements of the method') <>-* ((tStatement property: #pharoBlockStatementOwner) comment: '')) withoutPrimaryContainer.	
	(((blockDefinition property: #localVariables) comment: 'The local variables of the block') <>-* ((tVariableExpression property: #pharoBlockDefinitionVariableEntityOwner) comment: '')) withoutPrimaryContainer.	


	(((arrayExpression property: #contents) comment: 'The expression in the array') <>-* ((tExpression property: #pharoArrayExpressionExpressionOwner) comment: '')) withoutPrimaryContainer.	

	(((arrayLiteral property: #contents) comment: 'The expression in the array') <>-* ((tExpression property: #pharoArrayLiteralExpressionExpressionOwner) comment: '')) withoutPrimaryContainer.	
	(((byteArrayLiteral property: #contents) comment: 'The expression in the array') <>-* ((tExpression property: #pharoByteArrayLiteralExpressionExpressionOwner) comment: '')) withoutPrimaryContainer.	
	
]

{ #category : #definition }
FASTPharoMetamodelGenerator >> defineTraits [
	super defineTraits.
	
	tLiteral := self remoteTrait: #TLiteral withPrefix: #FAST.
	"tVariableEntity := self remoteTrait: #TVariableEntity withPrefix: #FAST."
	tVariableExpression := self remoteTrait: #TVariableExpression withPrefix: #FAST.
	tBehaviouralEntity := self remoteTrait: #TBehaviouralEntity withPrefix: #FAST.
	tExpression := self remoteTrait: #TExpression withPrefix: #FAST.
	tNamedBehaviouralEntity := self remoteTrait: #TNamedBehaviouralEntity withPrefix: #FAST.
	tEntity := self remoteTrait: #TEntity withPrefix: #FAST.
	tStatement := self remoteTrait: #TStatement withPrefix: #FAST
]
