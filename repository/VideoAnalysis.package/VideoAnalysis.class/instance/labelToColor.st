plots - util
labelToColor
	^ {
		('Terminal' -> Color blue darker).
		('Plan de migration' -> Color orange darker).
		('Navigateur web' -> Color gray darker).
		('Navicat' -> Color green darker).
		('Editeur de texte' -> Color yellow darker).
		(nil -> Color red darker)
	} reversed asOrderedDictionary.