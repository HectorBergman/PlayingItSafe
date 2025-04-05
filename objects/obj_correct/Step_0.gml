if image_index == 36{
	sprite_set_speed(spr_correct, 0, spritespeed_framespersecond);
	life++
	if (life == lifeTime){
		sprite_set_speed(spr_correct, 30, spritespeed_framespersecond);
		//instance_destroy();
	}
}
	