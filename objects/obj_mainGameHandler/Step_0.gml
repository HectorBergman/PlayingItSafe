
for (var i = 0; i < ds_list_size(stationsAndAlerts); i++){
	var currentStation = ds_list_find_value(stationsAndAlerts, i);
	switch (miniHand.currentMinigame){
	    case minigame.none: {

			updateAlert(i);	
		
		} break;
		default:{ 
		} break;
	}

	if miniHand.currentMinigame != minigame.none && currentStation.alert == noone{
		var info = currentStation.stationInfoStruct
		info.timer++
		print("timer: " + string(info.timer))
		if info.timer == info.usedInterval{
			print("usedInterval : " + string(info.usedInterval))
			currentStation.alert = createAlert(currentStation); //see: scr_alertFunctions
			info.timer = 0
			info.usedInterval = generateNewInterval(info.interval,info.intervalSpread);
		}
	}
}