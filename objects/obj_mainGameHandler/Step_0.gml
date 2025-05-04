if (global.alertsPaused) {exit};
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
		info.timer += -alertsActive/totalStations/2 + 0.5 //For some reason, alertsActive is inverted, so -4
														  //means no alerts, and 0 means 4 alerts active
														  //probably easy to fix but idc
														  // /2 and +0.5 to make having a lot of alerts active
														  // not stop alert spawning as hard!
														  //0 alerts active = 1
														  //1 alert active = 0.875
														  //2 alerts active = 0.75
														  //3 alerts active = 0.625
														  //4 alerts active = 0.5 this case isnt relevant at time of writing
		//print("timer: " + string(info.timer))
		if info.summonCondition(info){
			//print("usedInterval : " + string(info.usedInterval))
			//print(currentStation);
			currentStation.alert = createAlert(currentStation); //see: scr_alertFunctions
			info.timer = 0
			info.usedInterval = generateNewInterval(info.interval,info.intervalSpread);
		}
	}else if room == rm_kitchen && currentStation.alert == undefined {
		summonCurrentAlert(i);
	}else if room != rm_kitchen{
		if currentStation.stationInfostruct.minigameRoom == room {
			currentStation.paused = true;
		}
	}
}