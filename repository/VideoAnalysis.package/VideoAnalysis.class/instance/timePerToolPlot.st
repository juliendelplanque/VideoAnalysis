plots
timePerToolPlot
	<vaPlot>
	| data |
	data := self timePerTool.
	^ MLBBarPlot new
		data: ((data associations
					sorted: [ :a :b | (self labelToPlotLabel keys indexOf: a head) < (self labelToPlotLabel keys indexOf: b head) ]) 
						collect: [ :assoc | assoc value asMinutes ]);
		labels: ((data keys sorted: [ :a :b | 
			(self labelToPlotLabel keys indexOf: a) < (self labelToPlotLabel keys indexOf: b) ])
				collect: [ :label | self labelToPlotLabel at: label ]);
		color: Color black;
		configYAxis: [ :yAxis |
			yAxis
				title: '# minutes of usage';
				max: 50 ];
		configXAxis: [ :xAxis |
			xAxis
				labelsRotation: 45 ];
		alignLabelCenter;
		yourself.