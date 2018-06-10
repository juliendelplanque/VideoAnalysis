plots generation
timePerToolMergedPlot
	<vaPlot>
	| data |
	data := (self videoAnalyses sorted: [ :a :b | a fileReferenceVideo basename < b fileReferenceVideo basename ]) collect: #timePerTool.
	data := (data first associations sorted: [ :a :b | (self videoAnalyses first labelToPlotLabel keys indexOf: a head) < (self videoAnalyses first labelToPlotLabel keys indexOf: b head) ]) 
				collect: [ :assoc |
					{ assoc value asMinutes . (data second at: assoc key) asMinutes . (data second at: assoc key) asMinutes } ].
	
	^ MLBStackedBarPlot new
		dataList: data;
		labels: (((self videoAnalyses first timePerTool keys sorted: [ :a :b | 
			(self videoAnalyses first labelToPlotLabel keys indexOf: a) < (self videoAnalyses first labelToPlotLabel keys indexOf: b) ])
				collect: [ :label | self videoAnalyses first labelToPlotLabel at: label ]) collect: [ :str | str copyReplaceAll: ' ' with: String lf ]);
		colorList: { Color gray darker darker . Color gray . Color gray lighter lighter };
		configYAxis: [ :yAxis |
			yAxis
				title: '# minutes of usage';
				max: (data collect: #sum) max + 5 ];
		configXAxis: [ :xAxis |
			xAxis
				labelsRotation: 60 ];
		style: self style;
		alignLabelEdge;
		yourself.