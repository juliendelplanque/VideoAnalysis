plots
ganttPlotToolsUsage
	<vaPlot>
	| dict data plot i colors |
	dict := self ganttData.
	data := dict associations
		sorted: [ :a :b | a isNil and: [ b isNotNil or: [ a head > b head ] ] ].
	colors := {('Terminal' -> Color blue darker).
	('Plan de migration' -> Color orange darker).
	('Navigateur web' -> Color gray darker).
	('Navicat' -> Color green darker).
	('Editeur de texte' -> Color yellow darker).
	(nil -> Color red darker)} asDictionary.
	plot := MLBLinePlot new.
	i := 1.
	data
		do: [ :dataItem | 
			| valueList |
			valueList := dataItem value.
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
						color: (colors at: dataItem head);
						width: 1.0;
						marker: '|' ].
			i := i + 1 ].
	plot
		configYAxis: [ :xAxis | xAxis labels: {''} , (data collect: #head) ];
		configXAxis: [ :yAxis | 
			yAxis
				min: 0;
				ticks: (0 to: 80 minutes asSeconds by: 20 minutes asSeconds);
				labels:
					((0 to: 80 minutes asSeconds by: 20 minutes asSeconds)
						collect: [ :tick | tick seconds asVAString ]);
				title: 'elapsed time (hh:mm)' ].
	^ plot