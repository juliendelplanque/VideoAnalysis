plots generation
timePerActivityMergedPlot
	<vaPlot>
	| data |
	data := (self videoAnalyses sorted: [ :a :b | a fileReferenceVideo basename < b fileReferenceVideo basename ]) collect: #timePerActivity.
	data := ((data first associations sorted: [ :a :b | a head < b head ]) collectWithIndex: [ :assoc :i | 
							{ assoc tail asMinutes . (data second at: assoc head) asMinutes . (data third at: assoc head) asMinutes } ]).
	
	^ MLBStackedBarPlot new
		dataList: data;
		labels: (0 to: data size - 1);
		colorList: { Color gray darker darker . Color gray . Color gray lighter lighter };
		configYAxis: [ :yAxis |
			yAxis
				title: '# minutes spent';
				max: (data collect: #sum) max + 5 ];
		configXAxis: [ :xAxis |
			xAxis
				labelsRotation: 90;
				title: 'Activity type #' ];
		style: self style;
		barWidth: 0.75;
		alignLabelCenter;
		yourself.