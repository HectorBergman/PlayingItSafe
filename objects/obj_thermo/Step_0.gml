x = mouse_x;
y = mouse_y;

// Stove mechanic, turning on and off the stove, includes four states



if place_meeting(x, y, obj_food)
{
	

	//I draw event, space bar så ser man temperatur på maten	
	
	if keyboard_check_pressed(vk_enter)
	{
		miniHand.minigameStatus = status.finished;
		print("Game is complete");
	}
}


if place_meeting(x, y, obj_food) && obj_food.state == 0
{
	print("Food is raw, you still have to wait");
}

if place_meeting(x, y, obj_food) && obj_food.state == 1
{
	print("Food is cooking, Getting closer");
	state = 1;
}

if place_meeting(x, y, obj_food) && obj_food.state == 2
{
	print("Food has reached temperature, but has it been enough time");
	state = 2;
	
}

if obj_food.after_done_counter >= obj_food.after_done_timer
{
	sprite_index = spr_thermo2;
}