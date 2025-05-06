tutorialState = miniHand.currentMinigame;
switch (tutorialState){
	case minigame.kitchen: tutorial_kitchen_control(); break;
	case minigame.dragAndDropFridgeLevels: tutorial_kitchen_control(); break;
}