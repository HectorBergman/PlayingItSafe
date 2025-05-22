//x = mouse_x;
//y = mouse_y;

// Stove mechanic, turning on and off the stove, includes four states



image_index = 0;

if obj_stoveControl.state != stoveState.off
{
	if place_meeting(x, y, obj_food) && obj_food.state == 0
	{
		image_index = 1;
	}

	if place_meeting(x, y, obj_food) && obj_food.state == 1
	{
		state = 1;
		image_index = 1;
	}

	if place_meeting(x, y, obj_food) && obj_food.state >= 2
	{
		image_index = 1;
		state = 2;
		if obj_food.after_done_counter >= miniHand.fryFoodTime
		{
			image_index = 2;
		}
	
	}
}

