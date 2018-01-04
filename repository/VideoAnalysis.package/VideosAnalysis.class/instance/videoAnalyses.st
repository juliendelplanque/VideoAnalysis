accessing
videoAnalyses
	^ ((self csvDirectory childrenMatching: '*.ods') reject: [ :f | #('plan.ods' 'analyse-video-partie2.ods') includes: f basename ])
		collect: [ :fileRef |
			VideoAnalysis new
				fileReferenceVideo: fileRef;
				yourself ]