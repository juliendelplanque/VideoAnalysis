computation
ganttData
	| dict |
	dict := self videoData groupedBy: #tool.
	dict keysDo: [ :key |
		dict at: key put: ((((dict at: key) sorted: [ :a :b | a beginTime < b beginTime ]) piecesCutWhere: [ :itemA :itemB | (itemA endTime + 1 second) ~= itemB beginTime ]) collect: [ :array |
			VAItem new
				beginTime: array first beginTime;
				endTime: array last endTime;
				yourself ]) ].
	(self labelToPlotLabel keys \ dict keys) do: [ :key |
		dict at: key put: #() ].
	^ dict 