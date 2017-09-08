accessing
number
	^ #digit asParser plus token ==> [ :t | t value asNumber ]
