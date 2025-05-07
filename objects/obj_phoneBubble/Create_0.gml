enum bubbleStates{
	notVisible,
	startFadeIn,
	fadingIn,
	isVisible,
	startFadeOut,
	fadingOut,
}

baseAlpha = 0;
imageAlphaMult = 1;
bubbleState = bubbleStates.notVisible
bubbleHoverState = bubbleStates.isVisible

tween = noone;

function shouldFadeBubble(){
	return shouldFade(obj_player,obj_pointer_vari,obj_pointer,obj_pointer_menu,obj_rightHand, obj_cookFoodHand)
}

	