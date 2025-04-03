if inHand.mouseHeld && place_meeting(x,y,obj_hand){
	if !held{
		xRelative = x-hand.x
		yRelative = y-hand.y
	}
	held = true;
	x = mouse_x + xRelative;
	y = mouse_y + yRelative;
}else{
	held = false;
}