stove = noone;
stateOfStove = noone;
heat = 0;
baseSpriteSpeed = sprite_get_speed(sprite_index)
depth = 10;
function tweenHeat(target){
	var k = 30;
	var difference = abs(heat - target)
	var duration = k * sqrt(difference)
	TweenFire(id, EaseOutQuad, 0, false, 0, duration, "heat", heat, target)
}
