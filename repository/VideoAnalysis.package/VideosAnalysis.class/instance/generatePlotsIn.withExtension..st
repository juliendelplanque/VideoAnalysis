plots generation
generatePlotsIn: aDirectoryFileReference withExtension: extension
	aDirectoryFileReference isDirectory
		ifFalse: [ self error: 'Need a directory as parameter.' ].
		
	self videoAnalyses do: [ :videoAnalysis |
		self plotSelectors do: [ :plotSelector |
			(plotSelector value: videoAnalysis)
				generateIn: aDirectoryFileReference / ( videoAnalysis fileReferenceVideo basenameWithoutExtension , '-' , plotSelector , '.' , extension ) ] ].
		
	self timePerActivityMergedPlot generateIn: aDirectoryFileReference / 'timePerActivity.pdf'.
	self timePerToolMergedPlot generateIn: aDirectoryFileReference / 'timePerTool.pdf'.
	self timePerActivityOccurencesMergedPlot generateIn: aDirectoryFileReference / 'activityOccurences.pdf'.