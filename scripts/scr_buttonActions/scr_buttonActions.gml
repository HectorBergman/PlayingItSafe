function button_settings(){ //go to settings
	parent.currentScreen = pauseScreen.settings
	parent.screenState = screenStates.brandNew
	instance_destroy();
}

function button_back(){
	parent.screenState = screenStates.brandNew;

	switch (parent.currentScreen){ //go to main pause screen if in settings, else unpause
		case pauseScreen.paused: parent.currentScreen = pauseScreen.notPaused; break;
		case pauseScreen.settings: parent.currentScreen = pauseScreen.paused; with(parent){unravelSettings();} break;
		case pauseScreen.menuSettings: parent.currentScreen = pauseScreen.notPaused; with (parent){unravelSettings();} break;
	}
}
function button_plus(){
	if global.masterVolume < 1{
		global.masterVolume += 0.1
	}
}
function button_minus(){
	if global.masterVolume > 0{
		global.masterVolume -= 0.1
	}
}

function drawButton(button){
	if button.buttonText != ""{
		var text = ""
		var color = 0;
		if button.image_index == 0{
			text = "[scale," + string(button.scale) + "][fnt_bitmap_outline_huge][$2c3d04]"; 
			color = $000034;
		}else{
			text = "[scale," + string(button.scale) + "][fnt_bitmap_outline_huge][$340000]"; 
			color = $000023;
		}
		text += button.buttonText;
		var toDraw = scribble(text).align(fa_center, fa_middle).fit_to_box(button.sprite_width-16*scale, button.sprite_height-16*scale).outline(color)
		toDraw.draw(button.x, button.y+button.sprite_height/2);
	}
}
