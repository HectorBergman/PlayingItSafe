originalCoords = [x,y]
originalRoom = room;
interactable = true;
alert = noone;




//for all below: edit in variable definitions
infoStruct = {
	uniqueID : uniqueID,
	timer : 0,
	interval : interval, // todo: maybe make this ramp up
	intervalSpread : intervalSpread, 
	alertLifetime : alertLifetime,
	difficulty : difficulty,// todo: make this ramp up
}




usedInterval = generateNewInterval(interval,intervalSpread);
