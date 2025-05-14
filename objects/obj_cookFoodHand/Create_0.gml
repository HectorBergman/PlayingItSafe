depth = -100
holding = false;
heldObject = noone;

stoveControl = noone;
stoveValue = -300;
preTurnStoveValue = stoveValue

note = noone;
stoveRanges = [-300,300];

canHold = true;
preTurnStoveAngle = 0;

enum fryFoodStates{
	normal,
	changingTemp,
}
turnPoint = [0,0];

mouseTracker = summonObject(obj_mouseTracker);

fryFoodState = fryFoodStates.normal;

firstGrab = false;


//leftHand = summonObject(obj_leftHand,[["x", room_width/4], ["y", room_height*1.3], ["parent", id]]);



movabilityState = movability.movable

scrubTween = noone;

function stopChangingTemp(){
	fryFoodState = fryFoodStates.normal;
	movabilityState = movability.halfmovable;
	mouseTracker.visible = false;
	TweenFire(id,EaseOutQuad,0, false, 0, 24, "image_angle", image_angle, 0);
}





