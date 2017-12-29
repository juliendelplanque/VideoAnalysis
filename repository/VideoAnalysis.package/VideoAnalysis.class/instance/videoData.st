accessing
videoData
	| worksheet |
	worksheet := (self fileReferenceVideo readStreamDo: [ :s | ODSImporter fromStream: s ]) worksheets first.
	^ worksheet rows allButFirst collect: [ :row |
	|data|
	data := worksheet columns collect: [ :col |
		worksheet dataAtCol: col row: row ].
	VAItem new
		beginTime: (Duration fromVAString: data first);
		endTime: (Duration fromVAString: data second);
		note: data third;
		comment: data fourth;
		tool: data fifth;
		step: data sixth;
		yourself ]
	