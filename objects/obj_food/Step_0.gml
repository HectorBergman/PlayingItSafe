
goalTemp = mapRange(obj_stoveControl.image_angle, 120,-120,tempRange[0],tempRange[1]);
if goalTemp > temp{
	smoothingFactor = smoothingFactorHeating;
}else{
	smoothingFactor = smoothingFactorCooling;
}

temp = temp + (goalTemp - temp) * smoothingFactor;


age+= 2*mapRange(temp, tempRange[0],tempRange[1],0,100)/tempRange[1];
//2*(0 to 1 depending on how hot the food is)

image_index = state
if temp > 85 && miniHand.minigameStatus != status.finished
{
	state = foodState.burned;
	
}
if temp >= miniHand.fryFoodDesiredTemp{
	after_done_counter++;
}
if state != foodState.burned && miniHand.minigameStatus != status.finished{
	if age < stateAge[0]
	{
		state = foodState.raw;
	}
	else if age <= stateAge[1]
	{
		state = foodState.partiallyDone;
	}
	else if age <= stateAge[2]
	{
		state = foodState.done;
	
	}
}

else
{
	print("Food state other, might need debugging");	
}

