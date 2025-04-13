/// @desc creates an alert, to be called by obj_interactableEvent
/// @returns {any} created alert


function createAlert(element){
	var info = element.stationInfostruct
	var alertInfo = {age : 0, lifetime : info.alertLifetime}
	var alert = undefined;
	if miniHand.currentMinigame == minigame.none{
		alert = summonObject(obj_alert,
							[["x", info.stationX+info.alertXOffset], ["y", info.stationY+info.alertYOffset], 
							 ["minigame", info.minigameRoom], ["minigameEnum", info.chosenMinigame], 
							 ["difficulty", info.difficulty], ["lifetime", info.alertLifetime]]);
	}
	
	element.identity = alert
	element.alertInfo = alertInfo
	return alert								
}


function summonCurrentAlert(index){
	var currentStructs = ds_list_find_value(mainGameHand.stationsAndAlerts, index);
	var info = currentStructs.stationInfostruct
	var alert = summonObject(obj_alert,
							[["x", info.stationX+info.alertXOffset], ["y", info.stationY+info.alertYOffset], 
							 ["minigame", info.minigameRoom], ["minigameEnum", info.chosenMinigame], 
							 ["difficulty", info.difficulty], ["lifetime", info.alertLifetime]]);
							 
	currentStructs.alert = alert;
}

/// @desc deletes an alert
/// @param {any} structs entry in stationsAndAlerts to remove
/// @param {real} index index of entry to remove in list
function removeAlert(structs,index){
	var alert = structs.alert
	if alert != undefined{
		instance_destroy(alert);
	}
	structs.alert = noone;
}

function updateAlert(index){
	var currentStructs = ds_list_find_value(mainGameHand.stationsAndAlerts, index);
	var currentAlert = currentStructs.alert;
	if currentAlert != noone{
		if room != rm_kitchen{
			currentAlert = undefined;
		}
	
		currentStructs.alertInfo.age++ //(increase age)
		if currentStructs.alertInfo.lifetime == currentStructs.alertInfo.age{
			scoreHand.currentScore -= 30;
			removeAlert(currentStructs, index);
		}
	}
}


function findCurrentIndex(alert){
	var index = ds_list_find_index(mainGameHand.stationsAndAlerts, alert);
	return index;
}



