PAUSE


var time = pulseHand.timer mod totalTime
if time <= fadingTime {
	image_alpha = time/(fadingTime)
}else if time >= totalTime-fadingTime{
	image_alpha= ((totalTime-time)/(fadingTime));
}

