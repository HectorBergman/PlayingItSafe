
function minigame_kitchen_control(){

	switch (minigameStatus){
		case status.started: minigame_kitchen_create(); break;
		case status.ongoing: minigame_kitchen_step(); break;
		case status.finished: minigame_kitchen_finish(); break;
		case status.none: break;
	}
}

function minigame_kitchen_create(){
	

	player = instance_find(obj_player, 0);
	
	
	for (var i = 0; i < ds_list_size(mainGameHand.stationsAndAlerts); i++){
		var currentStation = ds_list_find_value(mainGameHand.stationsAndAlerts, i);
		currentStation.paused = false;
	}
	minigameStatus = status.ongoing;
}


function minigame_kitchen_step(){

}


function minigame_kitchen_finish(){

}
