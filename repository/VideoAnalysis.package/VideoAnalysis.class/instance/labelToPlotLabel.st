plots - util
labelToPlotLabel
	^ {
		('Terminal' -> 'Terminal').
		('Plan de migration' -> 'Roadmap').
		('Navigateur web' -> 'Web browser').
		('Navicat' -> 'Navicat').
		('Editeur de texte' -> 'Text editor').
		(nil -> 'Others')
	} reversed asOrderedDictionary.