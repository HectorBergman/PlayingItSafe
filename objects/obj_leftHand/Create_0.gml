image_index = 2;

depth = parent.depth+1
xOffset = -20;
yOffset = 20;
found = false;
firstTimeTimer = 0;
firstTimeTime = 65;
leaving = false;


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