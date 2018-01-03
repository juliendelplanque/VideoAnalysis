computation
stepDurationsAsSeconds
	^ self videoData collect: [ :item | item duration asSeconds ]