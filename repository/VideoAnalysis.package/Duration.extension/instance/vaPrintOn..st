*VideoAnalysis
vaPrintOn: aStream
	"Print as HH:MM[:SS]" 	| h m s |
	h := self hours abs.
	m := self minutes abs.
 	s := self seconds abs truncated.
	h < 10 ifTrue: [ aStream nextPut: $0. ].
	h printOn: aStream. aStream nextPut: $:.
	m < 10 ifTrue: [ aStream nextPut: $0. ].
	m printOn: aStream.
	s = 0 ifTrue: [ ^ self ].
	aStream nextPut: $:.
	s < 10 ifTrue: [ aStream nextPut: $0. ].
	s printOn: aStream