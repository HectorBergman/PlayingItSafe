if (!position_meeting(mouse_x, mouse_y, id)){
	if image_alpha < 0.75{
		image_alpha += 0.05;
	}
	hover = false;
}else{
	if image_alpha > 0.25{
		image_alpha -= 0.05;
	}
	hover = true;
}