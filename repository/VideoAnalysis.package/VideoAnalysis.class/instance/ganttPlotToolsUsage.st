plots
ganttPlotToolsUsage
	| dict data plot i |
	dict := self ganttData: self video1Data.
	data := dict associations.
	plot := MLBLinePlot new.
	i := 1.
	data
		do: [ :dataItem | 
			| valueList |
			valueList := dataItem value.
			plot
				addLine: [ :line | 
					| sorted points |
					sorted := valueList sorted: [ :a :b | a beginTime < b beginTime ].
					points := OrderedCollection new.
					points
						add: sorted first beginTime asSeconds @ i;
						add: sorted first endTime asSeconds @ i.
					sorted
						overlappingPairsDo: [ :itemA :itemB | 
							points
								add: (itemA endTime asSeconds + 1) @ Float nan;
								add: (itemB beginTime asSeconds - 1) @ Float nan;
								add: itemB beginTime asSeconds @ i;
								add: itemB endTime asSeconds @ i ].
					line
						points: points;
						color: Color random;
						width: 1.0;
						marker: '|' ].
			i := i + 1 ].
	plot configYAxis: [ :xAxis | xAxis labels: {''} , (data collect: #head) ].
	^ plot