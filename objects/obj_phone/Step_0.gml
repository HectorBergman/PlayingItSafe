switch (phoneState){
	case phoneStates.offScreen: break;
	case phoneStates.startRollIn: tween = TweenFire(id, EaseOutQuad,0,false,0,40,"x",offScreenX,0); phoneState = phoneStates.rollingIn;
	case phoneStates.rollingIn: if !TweenIsPlaying(tween){phoneState = phoneStates.onScreen; bubble.bubbleState = bubbleStates.startFadeIn}; break;
	case phoneStates.onScreen: break;
	case phoneStates.startRollOut: tween = TweenFire(id, EaseOutQuad,0,false,0,40,"x",0,offScreenX); phoneState = phoneStates.rollingOut;
	case phoneStates.rollingOut: if !TweenIsPlaying(tween){phoneState = phoneStates.offScreen; }; break;
}