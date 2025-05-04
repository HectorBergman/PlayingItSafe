PAUSE
debugTime++ //for debugging only

//follow dragAndDrop's example when creating minigames. See: scr_dragAndDrop
//also see: scr_minigameTemplate
if currentMinigame != minigame.none{
	if minigameStatus == status.started{
		for (var i = 0; i < ds_list_size(mainGameHand.stationsAndAlerts); i++){
			var currentStation = ds_list_find_value(mainGameHand.stationsAndAlerts, i);
			if stringToEnum(currentStation.stationInfostruct.chosenMinigame) != currentMinigame{
				if currentStation.alert != noone{
					currentStation.alert = undefined;
				}
			}
		}
	}
}
switch (currentMinigame){
    case minigame.none: minigame_none_control(); break;
	case minigame.dragAndDrop: minigame_dragAndDrop_control(); break;
	case minigame.dragAndDropFridgeLevels: minigame_dragAndDrop_variant_control(); break;
	case minigame.fallingChicken: minigame_fallingChicken_control(); break;
	case minigame.washingHands: minigame_washingHands_control(); break;
	case minigame.fryFood: minigame_fryFood_control(); break;
}


