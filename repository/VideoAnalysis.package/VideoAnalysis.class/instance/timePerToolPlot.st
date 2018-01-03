plots
timePerToolPlot
	<vaPlot>
	| data |
	data := self timePerTool.
	^ MLBBarPlot new
		data: ((data associations collect: [ :assoc | assoc value asMinutes ]) sorted: [ :a :b | a> b ]);
		labels: (data keys sorted: [ :a :b | (data at: a) > (data at: b) ]);
		color: Color blue;
		configYAxis: [ :yAxis |
			yAxis
				title: '# minutes of usage';
				max: 50 ];
		configXAxis: [ :xAxis |
			xAxis
				labelsRotation: 45 ];
		alignLabelCenter;
		yourself.