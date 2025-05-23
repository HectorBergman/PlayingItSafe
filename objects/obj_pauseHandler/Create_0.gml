enum pauseScreen{
	paused,
	settings,
	notPaused,
	menuSettings,
}
enum screenStates{
	brandNew,
	old,
}

currentScreen = pauseScreen.notPaused
screenState = screenStates.old

global.pause = false;
global.pausable = true;
scale = 2;
mouseCoordsOnPause = [0,0];

settingsButton = noone;
backButton = noone;
volumeBar = noone;



function pauseMenu_drawButton(button){
	
	draw_sprite_ext(button.sprite_index, button.image_index, button.x,button.y,scale,scale,0,c_white,1);
	drawButton(button)
}

function volumeBarDrawer(bar){
	if (!bar.adult){
		if (bar.type == "master"){
			//I dont know why x has to be bar.x-356, 356 is the width of the sprite but I don't know why it's needed. 
			//But it's offset unless you add -356 so that's why it's there
			draw_sprite_part_ext(bar.sprite_index, bar.image_index, 0, 0, floor(bar.sprite_width*global.masterVolume), bar.sprite_height,
								 bar.x, bar.y, scale, scale, c_white, 1);
		}else if (bar.type == "music"){
			draw_sprite_part_ext(bar.sprite_index, bar.image_index, 0, 0, floor(bar.sprite_width*global.musicVolume), bar.sprite_height,
								 bar.x, bar.y, scale, scale, c_white, 1);
		}else if (bar.type == "sfx"){
			draw_sprite_part_ext(bar.sprite_index, bar.image_index, 0, 0, floor(bar.sprite_width*global.soundFx), bar.sprite_height,
								 bar.x, bar.y, scale, scale, c_white, 1);
		}
	}else{
		draw_sprite_ext(bar.sprite_index, bar.image_index, bar.x, bar.y, scale, scale, 0, c_white, 1);
	}
}


#macro PAUSEVARS try{prePauseSpeed = sprite_get_speed(sprite_index)}catch(e){}
#macro PAUSE if (global.pause) exit//{sprite_set_speed(sprite_index, 0, spritespeed_framespersecond); exit}else{  

