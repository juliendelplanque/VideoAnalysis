plots generation
timePerActivityOccurencesMergedPlot
	<vaPlot>
	| data |
	data := (self videoAnalyses sorted: [ :a :b | a fileReferenceVideo basename < b fileReferenceVideo basename ]) collect: #activityOccurences.
	data := ((data first associations sorted: [ :a :b | a head < b head ]) collectWithIndex: [ :assoc :i | 
							{ assoc tail . (data second at: assoc head) . (data third at: assoc head) } ]).
	
	^ MLBStackedBarPlot new
		dataList: data;
		labels: (0 to: data size - 1);
		colorList: { Color gray darker darker . Color gray . Color gray lighter lighter };
		configYAxis: [ :yAxis |
			yAxis
				title: '# occurences';
				max: (data collect: #sum) max + 5 ];
		configXAxis: [ :xAxis |
			xAxis
				labelsRotation: 90;
				title: 'Activity type #' ];
		style: self style;
		barWidth: 0.75;
		alignLabelCenter;
		yourself.