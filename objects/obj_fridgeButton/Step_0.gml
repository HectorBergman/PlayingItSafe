PAUSE
if collision_point(mouse_x, mouse_y, id, true, false){
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

