/// @desc creates an alert, to be called by obj_interactableEvent
/// @returns {any} created alert


function createAlert(element){
	var info = element.stationInfostruct
	var alertInfo = {age : 0, lifetime : info.alertLifetime}
	var alert = undefined;
	if miniHand.currentMinigame == minigame.none{
		alert = summonObject(obj_alert, getAlertInfo(info));
	}
	
	element.identity = alert
	element.alertInfo = alertInfo
	return alert								
}

function getAlertInfo(info){
	return [["x", info.stationX+info.alertXOffset], ["y", info.stationY+info.alertYOffset], 
			["minigame", info.minigameRoom], ["minigameEnum", info.chosenMinigame], 
			["difficulty", info.difficulty], ["lifetime", info.alertLifetime], 
			["summonCondition", info.summonCondition],["deletionCondition", info.deletionCondition]]
}


function summonCurrentAlert(index){
	var currentStructs = ds_list_find_value(mainGameHand.stationsAndAlerts, index);
	var info = currentStructs.stationInfostruct
	var alert = summonObject(obj_alert, getAlertInfo(info));
							 
	currentStructs.alert = alert;
}

/// @desc deletes an alert
/// @param {any} structs entry in stationsAndAlerts to remove
function removeAlert(structs){
	var alert = structs.alert
	if alert != undefined{
		instance_destroy(alert);
	}
	structs.alert = noone;
}

function updateAlert(index){
	var currentStructs = ds_list_find_value(mainGameHand.stationsAndAlerts, index);
	
	

		
	var currentAlert = currentStructs.alert;
	try{
		//print(string(currentStructs.station) + ":  " + string(currentStructs.alertInfo.age));
	}catch(e){
	}
	if !currentStructs.paused{
		if currentAlert != noone{
			if room != rm_kitchen{
				currentAlert = undefined;
			}
	
			currentStructs.alertInfo.age++ //(increase age)
			if currentStructs.stationInfostruct.deletionCondition(currentStructs){
				//print("deleted");
				scoreHand.totalScore -= 30;
				removeAlert(currentStructs, index);
			}
		}
	}else{
		if room == rm_kitchen{
			
			removeAlert(currentStructs);
			generateNewInterval(currentStructs.stationInfostruct.interval,currentStructs.stationInfostruct.intervalSpread);
		}
	}
}


function findCurrentIndex(alert){
	for (var i = 0; i < ds_list_size(mainGameHand.stationsAndAlerts); i++){
		if (ds_list_find_value(mainGameHand.stationsAndAlerts,i).alert == alert){

		return i;
		}
	}
}

function cancelAlert(index){
	var currentStructs = ds_list_find_value(mainGameHand.stationsAndAlerts, index);
	
	
}
function defaultSummonCondition(info){
	return info.timer == info.usedInterval
}

function washingHandsSummonCondition(info){
	var m = miniHand
	return m.minigameStatus == status.started && m.currentMinigame == minigame.none &&
	(m.lastMinigame == minigame.fallingChicken || m.lastMinigame == minigame.dragAndDropFridgeLevels
	|| m.lastMinigame == minigame.none);
}
function defaultDeletionCondition(info){
	return info.alertInfo.lifetime == info.alertInfo.age
}

function washingHandsDeletionCondition(info){
	return room != rm_kitchen;
}

