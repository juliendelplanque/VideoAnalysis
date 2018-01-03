*VideoAnalysis
asVAString
	^ String streamContents: [ :s | self vaPrintOn: s ]