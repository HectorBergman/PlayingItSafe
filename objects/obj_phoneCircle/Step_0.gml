PAUSE


image_xscale = circleScale
image_yscale = circleScale;

switch (circleState){
	case circleStates.init: break;
	case circleStates.invisible: if parent.currentString != "" {circleState = circleStates.startExpand} break;
	case circleStates.startExpand: tween = TweenFire(id, EaseOutElastic,0,false,0,80,"circleScale",0,1); circleState = circleStates.expanding; break;
	case circleStates.expanding: if !TweenIsPlaying(tween){circleState = circleStates.donezo; phone.phoneState = phoneStates.startRollIn}; break;
	case circleStates.startContract: tween = TweenFire(id, EaseInBounce,0,false,0,80,"circleScale",1,0); circleState = circleStates.contracting; break;
	case circleStates.contracting: if !TweenIsPlaying(tween){circleState = circleStates.invisible}; break;
	case circleStates.donezo: break;
}

image_alpha = phone.image_alpha;
hitboxX = baseX*room_width/1920
hitboxY = baseY*room_height/1080
x = hitboxX;
y = hitboxY;
sprite_set_bbox(sprite_index,baseBBox[0]*room_width/1920,baseBBox[2]*room_height/1080,baseBBox[1]*room_width/1920,baseBBox[3]*room_height/1080);