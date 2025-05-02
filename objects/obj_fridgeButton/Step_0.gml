
if place_meeting(x,y,obj_pointer_vari){
	if inHand.mouseHeld{
		if !clicked{
			image_index = 1;
			clicked = true
			var cold = isCold;
			with (parent){
				changeTemp(!cold);
			}
		}
	}else{
		image_index = 0;
		clicked = false;
	}
}else{
	image_index = 0;
	clicked = false;
}

