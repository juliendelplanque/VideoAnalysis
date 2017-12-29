accessing
videoData
	^ self fileReferenceVideo readStreamDo: [ :stream | 
		(NeoCSVReader on: stream)
			recordClass: VAItem;
			skipHeader;
			addField: #beginTime: converter: [ :field | Duration fromVAString: field ];
			addField: #endTime: converter: [ :field | Duration fromVAString: field ];
			addField: #note:;
			addField: #comment:;
			addField: #tool:;
			addField: #step;
			upToEnd ]