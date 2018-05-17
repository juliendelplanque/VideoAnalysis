computation
timePerTool
	| dict |
	dict := ((self videoData groupedBy: #tool) associations collect: [ :assoc |
			assoc key -> (assoc value sum: #duration) ]) asDictionary.
		
	(self labelToPlotLabel keys \ dict keys) do: [ :key |
		dict at: key put: 0 minutes ].
	^ dict