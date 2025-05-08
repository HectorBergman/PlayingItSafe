enum phoneStates{
	init,
	offScreen,
	startRollIn,
	rollingIn,
	onScreen,
	startRollOut,
	rollingOut,
}
phoneState = phoneStates.init;
offScreenX = x;
tween = noone;

phoneHoverState = bubbleStates.isVisible
imageAlphaMult = 1;

bubble = summonObject(obj_phoneBubble, [["x",0], ["y",0], ["parent", id]]);
baseX = x
baseY = y
hitboxX = baseX*room_width/1920
hitboxY = baseY*room_height/1080
baseBBox = [bbox_left,bbox_right,bbox_top,bbox_bottom];


function shouldFadePhone(){
	return shouldFade(obj_player,obj_pointer_vari,obj_pointer,obj_pointer_menu,obj_rightHand, obj_cookFoodHand, obj_thermometer, obj_dragAndDrop_item_vari)
}

	