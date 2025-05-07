PAUSE


image_xscale = circleScale
image_yscale = circleScale;

switch (circleState){
	case circleStates.invisible: break;
	case circleStates.startExpand: print("hej"); tween = TweenFire(id, EaseOutElastic,0,false,0,100,"circleScale",0,1); circleState = circleStates.expanding; break;
	case circleStates.expanding: if !TweenIsPlaying(tween){circleState = circleStates.donezo; phone.phoneState = phoneStates.startRollIn}; break;
	case circleStates.startContract: tween = TweenFire(id, EaseInOutQuad,0,false,0,100,"circleScale",1,0); circleState = circleStates.contracting; break;
	case circleStates.contracting: if !TweenIsPlaying(tween){circleState = circleStates.invisible}; break;
	case circleStates.donezo: break;
}