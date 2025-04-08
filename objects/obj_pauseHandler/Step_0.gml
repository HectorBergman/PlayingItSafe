if (keyboard_check_pressed(vk_escape) && global.pausable){
	if global.pause{
		global.pause = false;
	}else{
		mouseCoordsOnPause = [mouse_x,mouse_y];
		global.pause = true;
	}
}