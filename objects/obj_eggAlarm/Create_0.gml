enum eggStates{
	idle,
	counting,
	alarming,
}
eggState = eggStates.idle;

time = 0;
timer = miniHand.fryFoodTime;

alarmTime = 40;

rings = 0;