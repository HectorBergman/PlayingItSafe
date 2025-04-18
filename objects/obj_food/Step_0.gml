if obj_stoveControl.state == 0
{
	cook_speed = 0;
	print("Currently empty, print is for debugging.");
}
else
{
	if obj_stoveControl.state == 1
	{
		alarm[0] = 2 * room_speed;
	}
	else if obj_stoveControl.state == 2
	{
		alarm[1] = 2 * room_speed;
	}
	else if obj_stoveControl.state == 3
	{
		alarm[2] = 2 * room_speed;
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
	after_done_timer++;
}
else if state == 3
{
	sprite_index = spr_burn;
	after_done_timer++;
}
else
{
	print("Food state other, might need debugging");	
}
