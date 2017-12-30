plots generation
generatePlotsIn: aDirectoryFileReference withExtension: extension
	aDirectoryFileReference isDirectory
		ifFalse: [ self error: 'Need a directory as parameter.' ].
		
	self videoAnalyses do: [ :videoAnalysis |
		self plotSelectors do: [ :plotSelector |
			(plotSelector value: videoAnalysis)
				generateIn: aDirectoryFileReference / ( videoAnalysis fileReferenceVideo basenameWithoutExtension , '-' , plotSelector , '.' , extension ) ] ]