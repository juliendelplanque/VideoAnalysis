computation
activityOccurences
	| res |
	res := (self videoData  groupedBy: #activity) collect: #size.
	
	0 to: 18 do: [ :i |
		(res includesKey: i)
			ifFalse: [ res at: i put: 0 ] ].
	^ res