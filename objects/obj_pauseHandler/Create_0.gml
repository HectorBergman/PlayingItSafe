enum pauseScreen{
	paused,
	settings,
	notPaused,
}
enum screenStates{
	brandNew,
	old,
}

currentScreen = pauseScreen.notPaused
screenState = screenStates.old


global.pause = false;
depth = -9999;
global.pausable = true;
scale = 2;
mouseCoordsOnPause = [0,0];

settingsButton = noone;
backButton = noone;

function drawButton(button){
	draw_sprite_ext(button.sprite_index, button.image_index, button.x*scale,button.y*scale,scale,scale,0,c_white,1);
}

function volumeBarDrawer(bar){
	if (!bar.adult){
		if (bar.type == "master"){
			draw_sprite_part_ext(bar.sprite_index, bar.image_index, 0, 0, floor(bar.sprite_width/3*global.volume), bar.sprite_height,
								 bar.x, bar.y, scale, scale, c_white, 1);
		}else if (bar.type == "music"){
			draw_sprite_part_ext(bar.sprite_index, bar.image_index, 0, 0, floor(bar.sprite_width/3*global.musicvolume), bar.sprite_height,
								 bar.x, bar.y, scale, scale, c_white, 1);
		}else if (bar.type == "sfx"){
			draw_sprite_part_ext(bar.sprite_index, bar.image_index, 0, 0, floor(bar.sprite_width/3*global.soundfx), bar.sprite_height,
								 bar.x, bar.y, scale, scale, c_white, 1);
		}
	}else{
		draw_sprite_ext(bar.sprite_index, 1, bar.x, bar.y, 3, 3, 0, c_white, 1);
	}
}

#macro PAUSEVARS prePauseSpeed = sprite_get_speed(sprite_index)
#macro PAUSE if (global.pause) exit//{sprite_set_speed(sprite_index, 0, spritespeed_framespersecond); exit}else{  

