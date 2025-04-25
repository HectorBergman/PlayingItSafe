if badOrderingWorkaround{
	
	for (var i = 0; i < instance_number(obj_interactableEvent); i++){
		var newStation = instance_find(obj_interactableEvent, i)
		newStation.infoStruct.usedInterval = generateNewInterval(newStation.infoStruct.interval,newStation.infoStruct.intervalSpread);
		ds_list_add(stationsAndAlerts, {station: newStation, stationInfostruct: newStation.infoStruct,
										alert: noone, alertInfo: undefined, paused : true})
		totalStations++;						
	}
	

	badOrderingWorkaround = false;
}