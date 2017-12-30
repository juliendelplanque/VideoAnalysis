printing
printOn: aStream
	super printOn: aStream.
	aStream
		<< $(.
	
	self number printOn: aStream.
	
	aStream
		<< '. '.
		
	self description printOn: aStream.
	
	aStream
		<< $)