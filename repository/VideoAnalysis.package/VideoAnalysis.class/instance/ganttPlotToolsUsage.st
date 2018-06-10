plots
ganttPlotToolsUsage
	"<vaPlot>"
	| dict data plot i |
	dict := self ganttData.
	data := dict associations
		sorted: [ :a :b | (self labelToColor keys indexOf: a key) < (self labelToColor keys indexOf: b key) ].
	plot := MLBLinePlot new.
	i := 1.
	data
		do: [ :dataItem | 
			| valueList |
			valueList := dataItem value.
			valueList
				ifEmpty: [ plot addPointsLine: [ :line | Float nan @ Float nan ] ]
				ifNotEmpty: [
			plot
				addPointsLine: [ :line | 
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
						color: (self labelToColor at: dataItem head);
						width: 1.0;
						marker: '|' ].
			i := i + 1 ] ].
	plot
		configYAxis: [ :xAxis | xAxis labels: {''} , (data collect: [ :assoc | self labelToPlotLabel at: assoc head]), {''} ];
		configXAxis: [ :yAxis | 
			yAxis
				min: 0;
				ticks: (0 to: 80 minutes asSeconds by: 20 minutes asSeconds);
				labels:
					((0 to: 80 minutes asSeconds by: 20 minutes asSeconds)
						collect: [ :tick | tick seconds asVAString ]);
				title: 'elapsed time (hh:mm)' ].
	^ plot