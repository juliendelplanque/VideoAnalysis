plots
timePerToolPlot
	<vaPlot>
	| data |
	data := self timePerTool: self video1Data.
	^ MLBBarPlot new
		data: ((data associations collect: [ :assoc | assoc value asMinutes ]) sorted: [ :a :b | a> b ]);
		labels: (data keys sorted: [ :a :b | (data at: a) > (data at: b) ]);
		color: Color blue;
		configYAxis: [ :yAxis |
			yAxis
				title: '# minutes of usage' ];
		alignLabelCenter;
		yourself.