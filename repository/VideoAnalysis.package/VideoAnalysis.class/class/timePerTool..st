computation
timePerTool: inputData
	^ ((inputData groupedBy: #tool) associations collect: [ :assoc |
			assoc key -> (assoc value sum: #duration) ]) asDictionary