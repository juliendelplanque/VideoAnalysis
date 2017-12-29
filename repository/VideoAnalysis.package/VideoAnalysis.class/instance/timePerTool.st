computation
timePerTool
	^ ((self videoData groupedBy: #tool) associations collect: [ :assoc |
			assoc key -> (assoc value sum: #duration) ]) asDictionary