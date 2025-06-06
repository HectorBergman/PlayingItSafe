enum noteStates{
	normal,
	reading,
	transition,
}

stateOfNote = noteStates.normal;
transitionDestination = noteStates.reading;
hasBeenRead = false;

panner = noone;
pointer = noone;
cam = noone;
dndHand = noone;
notification = noone;
transitionTimer = 0;
transitionTime = 60;

originCoords = [x,y];
hoveredCoords = [x+64,y];

pannerIsHovered = false;

tweenOfChoice = EaseOutQuart

itemHandler = noone;

outlineColor = $000034;

ownDndRead = [miniHand.dndRead[0],miniHand.dndRead[1],miniHand.dndRead[2]];
temperatureText = noone;
tipsArray = [
"Placera de livsmedeln som man behöver förvara i kyla i kylskåpet!",
"Temperaturerna kan variera på de olika nivåerna i kylskåpet. Animalistiska livsmedel (som t.ex. kött) och matrester är väldigt temperaturkänsliga. Se till att de håller sig riktigt kalla (under 4°C). Många frukter, grönsaker och rotsaker ska förvaras kallt men kan få köldskador vid alltför låga temperaturer. Använd termometern: [scale,0.125][spr_thermometer][scale,1] för att mäta temperaturen i kylen.",
"Det finns nu begränsat utrymme i kylen! Prioritera de mest temperaturkänsliga livsmedlena först.",
"Någon har varit och rört på termometern! Använd [scale,0.5][spr_fridgeButtons_display][scale,1] för att justera temperaturen så att den blir rätt igen."]

glowTween = 0;
tween = TweenFire(id, EaseInOutQuad, TWEEN_MODE_PATROL, false, 0, 40,"glowTween",0,0.35);

readTimer = 0;
readTime = 120;



function activateTransitionCheck(reverse){
	
	if panner.hover{//if panner is being hovered over
		if !pannerIsHovered{//one time check so as to not redo tween every frame
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

function getTemperatureListText(){ //not currently in use, gets a list of all items plus their lowest and highest temps
	
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

function readNote(){ //update note to know which text has been read
	hasBeenRead = true;
	if notification != noone{
		with (notification){
			selfDestruct();
		}
	}
	if miniHand.difficulty >= 4{
		if !ownDndRead[0]{
			ownDndRead[0] = true;
		}
	}
	if miniHand.difficulty >= 8{
		if !ownDndRead[1]{
			ownDndRead[1] = true;
		}
	}
	if miniHand.difficulty >= 12{
		if !ownDndRead[2]{
			ownDndRead[2] = true;
		}
	}
}

function isRead(){ //check if difficulty text has been read
	if miniHand.difficulty >= 4{
		if !ownDndRead[0]{
			return false;
		}
	}
	if miniHand.difficulty >= 8{
		if !ownDndRead[1]{
			return false;
		}
	}
	if miniHand.difficulty >= 12{
		if !ownDndRead[2]{
			return false;
		}
	}
	return true;
}
