
scale = 2;
image_xscale = scale;
image_yscale = scale;


state = pannerStates.left;
transitionState = transitionStates.wait;

cam = noone;
image_alpha = 0.75;
depth = -1000;
hover = false;

panCoords = [0,0];
meetingPointer = position_meeting(mouse_x, mouse_y, id);

function hoverLogic(){
	if (!meetingPointer){
		if image_alpha < 0.75{
			image_alpha += 0.05;
		}
		hover = false;
	}else{
		if image_alpha > 0{
			image_alpha -= 0.05;
		}
		hover = true;
	}
}

function transitionLogic(){
	switch (transitionState){
		case transitionStates.flipToRight:{
			image_xscale *= -1;
			transitionState = transitionStates.wait;
			x = panCoords[0] + room_width;
		}break;
		case transitionStates.flipToLeft:{
			image_xscale *= -1;
			transitionState = transitionStates.wait;
			x = panCoords[0]
		}break;
		case transitionStates.wait:{
		}break;
	}
}

/*