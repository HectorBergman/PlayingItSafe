//x = mouse_x;
//y = mouse_y;
PAUSE
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
