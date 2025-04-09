if (global.pause){
	draw_sprite_ext(spr_pauseBg, 0,0,0,scale,scale,0,c_white,1);
	draw_sprite_ext(spr_pausedText_temp, 0,window_get_width()/2,64,scale,scale,0,c_white,1);
	if instance_exists(settingsButton){
		draw_sprite_ext(settingsButton.sprite_index, settingsButton.image_index, settingsButton.x*scale,settingsButton.y*scale,scale,scale,0,c_white,1);
	}
	draw_sprite_ext(spr_hand, 0,mouse_x*scale,mouse_y*scale,scale,scale,0,c_white,1);

}