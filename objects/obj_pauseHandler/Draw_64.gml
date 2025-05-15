
if (global.pause){
	draw_sprite_ext(spr_pauseBg,0,0,0,scale,scale,0,c_white,1);
	draw_sprite_ext(spr_pauseText,0,1920/2,64,scale,scale,0,c_white,1);
	if instance_exists(settingsButton){
		pauseMenu_drawButton(settingsButton);
	}
	if instance_exists(backButton){
		pauseMenu_drawButton(backButton);
	}
	if instance_exists(volumeBar){
		volumeBarDrawer(volumeBar);
		volumeBarDrawer(volumeBar.child);
		pauseMenu_drawButton(volumeBar.plusButton);
		pauseMenu_drawButton(volumeBar.minusButton);
	}
	draw_sprite_ext(spr_hand, 0,mouse_x,mouse_y,scale,scale,0,c_white,1);
	//check if centered:
	//draw_rectangle(window_get_width()/2, 0, window_get_width()/2+1, window_get_height(), false)
}