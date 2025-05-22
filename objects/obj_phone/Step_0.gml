switch (phoneState){
	case phoneStates.offScreen: break;
	case phoneStates.startRollIn: tween = TweenFire(id, EaseOutQuad,0,false,0,40,"baseX",offScreenX,0); phoneState = phoneStates.rollingIn;
	case phoneStates.rollingIn: if !TweenIsPlaying(tween){phoneState = phoneStates.onScreen; bubble.bubbleState = bubbleStates.startFadeIn}; break;
	case phoneStates.onScreen: break;
	case phoneStates.startRollOut: tween = TweenFire(id, EaseOutQuad,0,false,0,40,"baseX",0,offScreenX); phoneState = phoneStates.rollingOut;
	case phoneStates.rollingOut: if !TweenIsPlaying(tween){phoneState = phoneStates.offScreen; parent.circleState = circleStates.startContract;}; break;
}

switch (phoneHoverState){
	case bubbleStates.isVisible: if shouldFadePhone(){phoneHoverState = bubbleStates.startFadeOut}break;
	case bubbleStates.startFadeIn: tween = TweenFire(id, EaseOutQuad,0,false,0,10,"imageAlphaMult",0.4,1); phoneHoverState = bubbleStates.fadingIn;
	case bubbleStates.fadingIn: if !TweenIsPlaying(tween){phoneHoverState = bubbleStates.isVisible}; break;
	case bubbleStates.notVisible: if !shouldFadePhone(){phoneHoverState = bubbleStates.startFadeIn} break;
	case bubbleStates.startFadeOut: tween = TweenFire(id, EaseOutQuad,0,false,0,10,"imageAlphaMult",1,0.4); phoneHoverState = bubbleStates.fadingOut;
	case bubbleStates.fadingOut: if !TweenIsPlaying(tween){phoneHoverState = bubbleStates.notVisible}; break;
}

hitboxX = (baseX-200)*room_width/1920
hitboxY = baseY*room_height/1080
x = hitboxX;
y = hitboxY;
sprite_set_bbox(sprite_index,baseBBox[0]*room_width/1920,baseBBox[2]*room_height/1080,baseBBox[1]*room_width/1920,baseBBox[3]*room_height/1080);
