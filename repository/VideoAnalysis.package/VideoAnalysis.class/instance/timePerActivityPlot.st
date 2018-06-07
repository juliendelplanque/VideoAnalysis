plots
timePerActivityPlot
	"<vaPlot>"
	| data |
	data := self timePerActivity.
	^ MLBBarPlot new
		data: ((data associations
					sorted: [ :a :b | a head < b head ]) 
						collect: [ :assoc | assoc value asMinutes ]);
		labels: data keys sorted;
		color: Color black;
		configYAxis: [ :yAxis |
			yAxis
				title: '# minutes spent';
				max: 35 ];
		configXAxis: [ :xAxis |
			xAxis
				labelsRotation: 45;
				title: 'Activity type #' ];
		alignLabelCenter;
		yourself.