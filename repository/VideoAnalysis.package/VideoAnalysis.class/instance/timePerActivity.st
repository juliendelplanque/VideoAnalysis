computation
timePerActivity
	| res |
	res := (self videoData  groupedBy: #activity) collect: [ :data |
		(data collect: [ :d | d endTime - d beginTime ]) sum ].
	
	0 to: 17 do: [ :i |
		(res includesKey: i)
			ifFalse: [ res at: i put: 0 second ] ].
	^ res