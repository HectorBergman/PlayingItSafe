enum noteStates{
	normal,
	reading,
	transition,
}
stateOfNote = noteStates.normal;
transitionDestination = noteStates.reading;

panner = noone;
pointer = noone;
cam = noone;
transitionTimer = 0;
transitionTime = 60;

originCoords = [x,y];
hoveredCoords = [x+64,y];

pannerIsHovered = false;

tweenOfChoice = EaseOutQuart

itemHandler = noone;

outlineColor = $000034;


temperatureText = noone;


function activateTransitionCheck(reverse){
	
	if panner.hover{
		if !pannerIsHovered{
			if !reverse{
				TweenEasyMove(originCoords[0],originCoords[1],hoveredCoords[0],hoveredCoords[1],0,20,tweenOfChoice);
			}else{	
				TweenEasyMove(hoveredCoords[0],hoveredCoords[1],originCoords[0],originCoords[1],0,20,tweenOfChoice);
			}
		}
		pannerIsHovered = true;
	}else{
		if pannerIsHovered{
			if !reverse{
				TweenEasyMove(hoveredCoords[0],hoveredCoords[1],originCoords[0],originCoords[1],0,20,tweenOfChoice);
			}else{	
				TweenEasyMove(originCoords[0],originCoords[1],hoveredCoords[0],hoveredCoords[1],0,20,tweenOfChoice);
			}
			
		}
		pannerIsHovered = false;
	}
	
	
	if panner.meetingPointer{
		if inHand.mouseClick{
			var targetCoords = [hoveredCoords[0],hoveredCoords[1]]
			if reverse{
				targetCoords = [0,0]
			}
			var tTime = transitionTime;
			var tween = tweenOfChoice
			panner.panCoords = [targetCoords[0],targetCoords[1]];
			with cam{
				panToCoord(targetCoords[0],targetCoords[1], tTime, tween);
			}
			panner.state = pannerStates.transition;
			if !reverse{
				panner.transitionState = transitionStates.flipToRight;
			}else{
				panner.transitionState = transitionStates.flipToLeft;
			}
			stateOfNote = noteStates.transition;
			if !reverse{
				transitionDestination = noteStates.reading;
			}else{
				transitionDestination = noteStates.normal;
			}
		}
	}
}

function getTemperatureListText(){
	
	var itemsListText = "";
	var lowestTempText = "";
	var highestTempText = "";
	var dashes = "";
	for (var i = 0; itemHandler.itemInfoArray[i] != noone; i++){
		var iArray = itemHandler.itemInfoArray[i];
		itemsListText +=  iArray._name + ":" + "\n";
		var number = real(iArray.lowestTemperature);
		var padding = "";
		if number >= 0{
			padding = " ";
		}
		lowestTempText += padding + string(iArray.lowestTemperature) + "\n";
		dashes += "-\n";
		
		highestTempText += string(iArray.highestTemperature) + "\n";
	}
	return [itemsListText, lowestTempText, highestTempText, dashes];
}


