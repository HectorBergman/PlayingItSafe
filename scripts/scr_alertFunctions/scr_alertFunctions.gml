/// @desc creates an alert, to be called by obj_interactableEvent
/// @returns {any} created alert


function createAlert(element){
	var alertInfo = {age : 0, lifetime : alertLifetime}
	var alert = undefined;
	if miniHand.currentMinigame == minigame.none{
		alert = summonObject(obj_alert,
							[["x", x+alertXOffset], ["y", y+alertYOffset], 
							 ["minigame", minigameRoom], ["minigameEnum", chosenMinigame], 
							 ["difficulty", difficulty], ["lifetime", alertLifetime],
							 ["parent", id]]);
	}
	
	element.identity = alert
	element.alertInfo = alertInfo
	return alert								
}

/// @desc deletes an alert
/// @param {any} structs entry in stationsAndAlerts to remove
/// @param {real} index index of entry to remove in list
function removeAlert(structs,index){
	structs.alert = noone;
	ds_list_delete(mainGameHand.activeAlerts, index)
	instance_destroy(alert);
	
}

function updateAlert(index){
	var currentStructs = ds_list_find_value(mainGameHand.stationsAndAlerts, index);
	var currentAlert = currentStructs.alert;
	if room != rm_kitchen && currentAlert != undefined{
		currentAlert = undefined;
	}

	currentStructs.alertInfo.age++ //(increase age)
	if currentStructs.alertInfo.lifetime == currentStructs.alertInfo.age{
		scoreHand.currentScore -= 30;
		removeAlert(currentStructs, index);
	}
}

