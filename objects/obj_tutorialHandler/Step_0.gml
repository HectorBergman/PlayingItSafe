PAUSE
startSummonTimer++
if startSummonTimer == startSummonTime{
	yapper.phoneCircle.circleState = circleStates.startExpand;
}
tutorialState = miniHand.currentMinigame;
switch (tutorialState){
	case minigame.kitchen: tutorial_kitchen_control(); break;
	case minigame.dragAndDropFridgeLevels: tutorial_dnd_control(); break;
}