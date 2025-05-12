lifeTime = 90;
life = 0;
scale = 4;
sprite_set_speed(sprite_index,0,spritespeed_framespergameframe);
spriteSpeed = sprite_get_speed(sprite_index);


drawX = 1920/2-sprite_width/2*scale //window_get_width
drawY = 1080/2-sprite_height/2*scale