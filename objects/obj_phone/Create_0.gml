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

phoneHoverState = bubbleStates.isVisible
imageAlphaMult = 1;

bubble = summonObject(obj_phoneBubble, [["x",0], ["y",0]]);


function shouldFadePhone(){
	return shouldFade(obj_player,obj_pointer_vari,obj_pointer,obj_pointer_menu,obj_rightHand, obj_cookFoodHand)
}

	