PAUSE
debugTime++ //for debugging only


//follow dragAndDrop's example when creating minigames. See: scr_dragAndDrop
//also see: scr_minigameTemplate
switch (currentMinigame){
    case minigame.none: minigame_none_control(); break;
	case minigame.dragAndDrop: minigame_dragAndDrop_control(); break;
	case minigame.dragAndDropFridgeLevels: minigame_dragAndDrop_variant_control(); break;
	case minigame.fallingChicken: minigame_fallingChicken_control(); break;
	case minigame.washingHands: minigame_washingHands_control(); break;
	case minigame.fryFood: minigame_fryFood_control(); break;
}


