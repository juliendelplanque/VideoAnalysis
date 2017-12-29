accessing
videoAnalyses
	^ (self csvDirectory childrenMatching: '*.ods')
		collect: [ :fileRef |
			VideoAnalysis new
				fileReferenceVideo: fileRef;
				yourself ]