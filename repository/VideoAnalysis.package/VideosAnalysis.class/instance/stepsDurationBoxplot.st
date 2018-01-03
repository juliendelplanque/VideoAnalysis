as yet unclassified
stepsDurationBoxplot
	| videos |
	videos := self videoAnalyses reject: [ :v | v fileReferenceVideo basename = 'analyse-video-partie2.ods' ].
	MLBBoxPlot new
		dataList: (videos collect: #stepDurationsAsSeconds);
		beHorizontal;
		configYAxis: [ :axis|
			axis
				labels: (videos collect: [ :v | v fileReferenceVideo basenameWithoutExtension ]) ];
		configXAxis: [ :axis |
			axis
				min: 0;
				max: (videos collect: [ :i | i stepDurationsAsSeconds max ]) max ];
		generateIn: self 