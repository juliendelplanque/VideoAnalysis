accessing
stepsData
	| worksheet |
	worksheet := (self stepsFileReference readStreamDo: [ :s | ODSImporter fromStream: s ]) worksheets first.
	
	^ worksheet rows allButFirst
		collect: [ :row | 
			| data |
			data := worksheet columns collect: [ :col | worksheet dataAtCol: col row: row ].
			VAStepItem new
				number: data first asNumber;
				description: data second;
				yourself ]