enum pannerStates{
	left,
	right,
	transition,
}

enum transitionStates{
	flipToRight,
	flipToLeft,
	wait,
}
state = pannerStates.left;
transitionState = transitionStates.wait;

image_alpha = 0.75;
depth = -1000;
hover = false;

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
			x += 64+32+8;
		}break;
		case transitionStates.flipToLeft:{
			image_xscale *= -1;
			transitionState = transitionStates.wait;
			x -= 64+32+8;
		}break;
		case transitionStates.wait:{
		}break;
	}
}

/*