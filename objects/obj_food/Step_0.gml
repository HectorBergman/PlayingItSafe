if obj_stoveControl.state == stoveState.off
{
	cook_speed = 0;
	print("Currently empty, print is for debugging.");
}
else
{
	if obj_stoveControl.state == stoveState.low
	{
		print("On low setting check")
		alarm[0] = 3 * timer;
	}
	else if obj_stoveControl.state == stoveState.medium
	{
		alarm[1] = 2 * timer;
	}
	else if obj_stoveControl.state == stoveState.high
	{
		alarm[2] = 1 * timer;
	}
	else
	{
		print("Stove state other, might need debugging");
	}
}


if state == 0
{
	sprite_index = spr_raw;
}
else if state == 1
{
	sprite_index = spr_partial;
}
else if state == 2
{
	sprite_index = spr_done;
	after_done_counter++;
}
else if state == 3
{
	sprite_index = spr_burn;
	after_done_counter++;
}
else
{
	print("Food state other, might need debugging");	
}
