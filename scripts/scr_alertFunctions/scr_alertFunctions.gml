/// @desc creates an alert, to be called by obj_interactableEvent
/// @returns {any} created alert


function createAlert(){
	var alert = summonObject(obj_alert,
							[["x", x+alertXOffset], ["y", y+alertYOffset], 
							 ["minigame", minigameRoom], ["minigameEnum", chosenMinigame], 
							 ["difficulty", difficulty], ["lifetime", alertLifetime],
							 ["parent", id]]);
	ds_list_add(mainGameHand.activeAlerts, alert)
	return alert
									
}

/// @desc deletes an alert
/// @param {any} alert to remove
/// @param {index} index of alert to remove in list
function removeAlert(alert,index){
	alert.parent.alert = noone;
	ds_list_delete(mainGameHand.activeAlerts, index)
	instance_destroy(alert);
	
}

function updateAlert(alert,index){

	alert.age++
	if alert.lifetime == alert.age{
		scoreHand.currentScore -= 30;
		removeAlert(alert,index);
	}

}
