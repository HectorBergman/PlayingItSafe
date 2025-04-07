debugTime++ //for debugging only

//follow dragAndDrop's example when creating minigames. See: scr_dragAndDrop
//also see: scr_minigameTemplate
switch (currentMinigame){
    case minigame.none: minigame_none_control(); break;
	case minigame.dragAndDrop: minigame_dragAndDrop_control(); break;
	case minigame.washingHands: minigame_washingHands_control(); break;
	
}


