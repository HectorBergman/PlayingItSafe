depth = -1001;
tween = TweenFire(id, EaseInOutQuad, TWEEN_MODE_PATROL, false, 0, 60,"image_alpha",0,0.5);

scale = 2;
image_xscale = scale;
image_yscale = scale;
function selfDestruct(){
	TweenStop(tween)
	instance_destroy();
}