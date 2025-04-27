enum winValues{
	noWin,
	tooHot,
	tooCold,
	justRight,
}

depth = -y;
hand = instance_find(obj_pointer_vari, 0); //mouse cursor
startCoords = [x,y] //coords at minigame start
held = false;
timeNotHeld = 0;
debugTime = 0;
winValue = winValues.noWin;

complete = false;

sprite_index = sprite;



function correctTemperature(area){
	print("-------");
	print(area.temperature);
	print(lowestTemperature);
	print(highestTemperature);
	if area.temperature >= lowestTemperature && area.temperature <= highestTemperature{
		winValue = winValues.justRight
	}
	else if area.temperature <= lowestTemperature{
		winValue = winValues.tooCold
	}else if area.temperature >= highestTemperature{
		winValue = winValues.tooHot
	}else{
		winValue = winValues.noWin //edge case, could be equated to tooHot
	}
}