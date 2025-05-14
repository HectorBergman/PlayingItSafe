enum bubbleStates{
	init,
	notVisible,
	startFadeIn,
	fadingIn,
	isVisible,
	startFadeOut,
	fadingOut,
}

baseAlpha = 0;
imageAlphaMult = 1;
bubbleState = bubbleStates.init
bubbleHoverState = bubbleStates.isVisible
baseX = x
baseY = y
hitboxX = baseX*room_width/1920
hitboxY = baseY*room_height/1080
baseBBox = [bbox_left,bbox_right,bbox_top,bbox_bottom];
tween = noone;

function shouldFadeBubble(){
	return shouldFade(obj_player,obj_alert,obj_pointer_vari,obj_pointer_menu,obj_rightHand, obj_cookFoodHand, obj_thermometer, obj_dragAndDrop_item_vari)
}

	