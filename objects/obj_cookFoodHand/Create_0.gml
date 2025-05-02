depth = -100
holding = false;
heldObject = noone;

stoveControl = noone;
stoveValue = -300;
preTurnStoveValue = stoveValue


stoveRanges = [-300,300];

enum fryFoodStates{
	normal,
	changingTemp,
}
turnPoint = [0,0];


fryFoodState = fryFoodStates.normal;

firstGrab = false;


//leftHand = summonObject(obj_leftHand,[["x", room_width/4], ["y", room_height*1.3], ["parent", id]]);



movabilityState = movability.movable

scrubTween = noone;







