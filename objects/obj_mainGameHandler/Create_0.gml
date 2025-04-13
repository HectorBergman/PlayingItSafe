stationsAndAlerts = ds_list_create();




for (var i = 0; i < instance_number(obj_interactableEvent); i++){
	var newStation = instance_find(obj_interactableEvent, i)
	ds_list_add(stationsAndAlerts, {station: newStation, stationInfostruct: newStation.infoStruct,
									alert: noone, alertInfo: undefined})
}


function generateNewInterval(interval,spread){
	return interval+(irandom_range(-spread,spread));
}