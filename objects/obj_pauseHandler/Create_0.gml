global.pause = false;

global.pausable = true;

mouseCoordsOnPause = [0,0];

#macro PAUSEVARS prePauseSpeed = sprite_get_speed(sprite_index)
#macro PAUSE if (global.pause) exit//{sprite_set_speed(sprite_index, 0, spritespeed_framespersecond); exit}else{  

