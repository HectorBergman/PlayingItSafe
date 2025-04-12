PAUSE

if interactable && alert == noone{
	timer++
	print("timer: " + string(timer))
	if timer == usedInterval{
		print("usedInterval : " + string(usedInterval))
		alert = createAlert(); //see: scr_alertFunctions
		timer = 0
		usedInterval = generateNewInterval(interval,intervalSpread);
	}
}