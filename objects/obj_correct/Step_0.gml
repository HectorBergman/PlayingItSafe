PAUSE


life++
if life mod 2 == 0{
	if !(image_index + 1.4 > 36){
		image_index += 1.4;
	}else{
		image_index = 36;
	}
}
/*if floor(image_index) >= 35{
	sprite_set_speed(spr_correct, 0, spritespeed_framespersecond);
	life++
	if (life == lifeTime){
		sprite_set_speed(spr_correct, spriteSpeed, spritespeed_framespersecond);
		//instance_destroy();
	}
}*/