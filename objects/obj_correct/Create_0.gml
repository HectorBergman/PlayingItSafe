lifeTime = 90;
life = 0;
scale = 4;
sprite_set_speed(sprite_index,0,spritespeed_framespergameframe);
spriteSpeed = sprite_get_speed(sprite_index);


drawX = window_get_width()/2-sprite_width/2*scale
drawY = window_get_height()/2-sprite_height/2*scale