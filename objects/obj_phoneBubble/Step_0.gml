PAUSE
switch (bubbleState){
	case bubbleStates.notVisible: break;
	case bubbleStates.startFadeIn: tween = TweenFire(id, EaseOutQuad,0,false,0,20,"baseAlpha",0,1); bubbleState = bubbleStates.fadingIn;
	case bubbleStates.fadingIn: if !TweenIsPlaying(tween){bubbleState = bubbleStates.isVisible}; break;
	case bubbleStates.isVisible: if parent.parent.parent.currentString == "" {bubbleState = bubbleStates.startFadeOut} break;
	case bubbleStates.startFadeOut: tween = TweenFire(id, EaseOutQuad,0,false,0,20,"baseAlpha",1,0); bubbleState = bubbleStates.fadingOut;
	case bubbleStates.fadingOut: if !TweenIsPlaying(tween){bubbleState = bubbleStates.notVisible; parent.phoneState = phoneStates.startRollOut;}; break;
}

switch (bubbleHoverState){
	case bubbleStates.isVisible: if shouldFadeBubble(){bubbleHoverState = bubbleStates.startFadeOut}break;
	case bubbleStates.startFadeIn: tween = TweenFire(id, EaseOutQuad,0,false,0,10,"imageAlphaMult",0.3,1); bubbleHoverState = bubbleStates.fadingIn;
	case bubbleStates.fadingIn: if !TweenIsPlaying(tween){bubbleHoverState = bubbleStates.isVisible}; break;
	case bubbleStates.notVisible: if !shouldFadeBubble(){bubbleHoverState = bubbleStates.startFadeIn} break;
	case bubbleStates.startFadeOut: tween = TweenFire(id, EaseOutQuad,0,false,0,10,"imageAlphaMult",1,0.3); bubbleHoverState = bubbleStates.fadingOut;
	case bubbleStates.fadingOut: if !TweenIsPlaying(tween){bubbleHoverState = bubbleStates.notVisible}; break;
}
image_alpha = baseAlpha*imageAlphaMult
hitboxX = baseX*room_width/1920
hitboxY = baseY*room_height/1080
x = hitboxX;
y = hitboxY;
sprite_set_bbox(sprite_index,baseBBox[0]*room_width/1920,baseBBox[2]*room_height/1080,baseBBox[1]*room_width/1920,baseBBox[3]*room_height/1080);
