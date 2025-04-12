switch (miniHand.currentMinigame){
    case minigame.none: {
		for (var i = 0; i < ds_list_size(activeAlerts); i++){
			var currentAlert = ds_list_find_value(activeAlerts,i);
			updateAlert(currentAlert,i);	
		}
	} break;
	default: {
		
	} break;
}

