*VideoAnalysis
fromVAString: aString
	| splitted |
	splitted := (aString splitOn: $:) collect: #asInteger.
	
	^ self
		days: 0
		hours: splitted first
		minutes: splitted second
		seconds: splitted third