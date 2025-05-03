if obj_stoveControl.state == stoveState.off
{
	cook_speed = 0;
	print("Currently empty, print is for debugging.");
}
else
{
	if obj_stoveControl.state == stoveState.low
	{
		age += 1;
	}
	else if obj_stoveControl.state == stoveState.medium
	{
		age += 2;
	}
	else if obj_stoveControl.state == stoveState.high
	{
		age += 3;
	}
	else
	{
		print("Stove state other, might need debugging");
	}
}


if age == 0
{
	temp = 20;
}
else if age < 260
{
	if obj_stoveControl.state = stoveState.off
	{
		temp += 0;
	} else
	{
		temp += 0.1;
	}
	state = 0;
	image_index = 0;
}
else if age <= 520
{
	if obj_stoveControl.state = stoveState.off
	{
		temp += 0;
	} else
	{
		temp += 0.1;
	}
	state = 1;
	image_index = 1;
}
else if age <= 780
{
	if obj_stoveControl.state = stoveState.off
	{
		temp += 0;
	} else
	{
		temp += 0.1;
	}
	state = 2;
	image_index = 2;
	after_done_counter++;
}
else if age > 780
{
	if obj_stoveControl.state = stoveState.off
	{
		temp += 0;
	} else
	{
		temp += 0.1;
	}
	state = 3;
	image_index = 3;
	after_done_counter++;
}
else
{
	print("Food state other, might need debugging");	
}
