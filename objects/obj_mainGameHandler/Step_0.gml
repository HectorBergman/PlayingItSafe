
for (var i = 0; i < ds_list_size(stationsAndAlerts); i++){
	var currentStation = ds_list_find_value(stationsAndAlerts, i);
	updateAlert(i);	
	switch (miniHand.currentMinigame){
	    case minigame.none: {
		} break;
		default:{ 
		} break;
	}
	
	if currentStation.alert == noone{
		var info = currentStation.stationInfostruct
		info.timer++
		//print("timer: " + string(info.timer))
		if info.summonCondition(info){
			//print("usedInterval : " + string(info.usedInterval))
			//print(currentStation);
			currentStation.alert = createAlert(currentStation); //see: scr_alertFunctions
			info.timer = 0
			info.usedInterval = generateNewInterval(info.interval,info.intervalSpread);
		}
	}else if room == rm_kitchen && currentStation.alert == undefined{
		summonCurrentAlert(i);
	}else if room != rm_kitchen{
		if currentStation.stationInfostruct.minigameRoom == room {
			currentStation.paused = true;
		}
	}
}