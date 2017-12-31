accessing
videoAnalyses
	^ ((self csvDirectory childrenMatching: '*.ods') reject: [ :f | f basename = 'plan.ods' ])
		collect: [ :fileRef |
			VideoAnalysis new
				fileReferenceVideo: fileRef;
				yourself ]