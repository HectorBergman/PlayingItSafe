image_index = 2;

depth = parent.depth+2
xOffset = -20;
yOffset = 20;
found = false;
firstTime = true;
leaving = false;
scrubPoint = instance_find(obj_scrubPoint, 0);
dryPoint = instance_find(obj_dryPoint, 0);
icePoint = instance_find(obj_icePoint,0);
ring = summonObject(obj_ice, [["x" , x], ["y", y], ["parent", id], ["rightHand", parent.id], ["image_index", 1],["depth", depth-1]]);
wristBand = summonObject(obj_ice, [["x" , x], ["y", y], ["parent", id], ["rightHand", parent.id], ["image_index", 0],["depth", depth-1]])
			

waterDrop = noone;

waterDrops = []; // Array to store water drop instances
waterDropTimer = 0; // Timer for creating new drops
maxWaterDrops = 8; // Maximum number of drops visible at once
			
soapBubble = noone;

soapBubbles = []; // Array to store water drop instances
soapBubbleTimer = 0; // Timer for creating new drops
maxSoapBubbles = 20; // Maximum number of drops visible at once

			
TweenEasyMove(x,y,icePoint.x,icePoint.y,0,30,EaseOutSine);

enum leftHandState{
	iceCheck,
	scrubbing,
	waiting,
}
state = leftHandState.iceCheck;

function scrubbyDubby(scrubHigh, scrubPoint, xDifference){
	var yDifference = 20;
	var tweenTime = irandom_range(6,8);
	var highDestination = scrubPoint.y+yDifference+irandom_range(-15,5);
	var lowDestination = scrubPoint.y-yDifference+irandom_range(-15,5);
	if scrubHigh{
		scrubTween = TweenEasyMove(x,y,scrubPoint.x+xDifference,highDestination,0,tweenTime,EaseInOutQuint);
	}else{
		scrubTween = TweenEasyMove(x,y,scrubPoint.x+xDifference,lowDestination,0,tweenTime,EaseInOutQuint);
	}
}