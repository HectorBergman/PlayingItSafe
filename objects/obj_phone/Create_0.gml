enum phoneStates{
	offScreen,
	startRollIn,
	rollingIn,
	onScreen,
	startRollOut,
	rollingOut,
}
phoneState = phoneStates.offScreen;
offScreenX = x;
tween = noone;

bubble = summonObject(obj_phoneBubble, [["x",0], ["y",0]]);
	