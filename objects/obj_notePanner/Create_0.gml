enum pannerStates{
	left,
	right,
	transition,
}

enum transitionStates{
	flip,
	wait,
}
state = pannerStates.left;
transitionState = transitionStates.wait;

image_alpha = 0.75;
depth = -1000;
hover = false;


function hoverLogic(){
	if (!position_meeting(mouse_x, mouse_y, id)){
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
		case transitionStates.flip:{
			image_xscale *= -1;
			transitionState = transitionStates.wait;
			x += 64+32+8;
		}
		case transitionStates.wait:{
		}
	}
}