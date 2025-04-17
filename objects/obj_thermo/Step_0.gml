x = mouse_x;
y = mouse_y;

// Stove mechanic, turning on and off the stove, includes four states


if place_meeting(x, y, obj_stoveControl)
{
	if keyboard_check_pressed(vk_up)
	{
		obj_stoveControl.state++;
		if obj_stoveControl.state >= 3
		{
			obj_stoveControl.state = 3;
			print("The stove can't be turned any higher");
			
		}
	}
	else if keyboard_check_pressed(vk_down)
	{
		obj_stoveControl.state--;
		if obj_stoveControl.state <= 0
		{
			obj_stoveControl.state = 0;
			print("The stove is off, you can't turn it any lower");
		}
	}
}

if place_meeting(x, y, obj_food)
{
	
	
	
	if keyboard_check_pressed(vk_enter)
	{
		print("Game is complete");
	}
}


if place_meeting(x, y, obj_food) && obj_food.sprite_index == spr_raw
{
	print("Food is raw, you still have to wait");
}

if place_meeting(x, y, obj_food) && obj_food.sprite_index == spr_partial
{
	print("Food is cooking, Getting closer");
	state = 1;
}

if place_meeting(x, y, obj_food) && obj_food.sprite_index == spr_done
{
	print("Food has reached temperature, but has it been enough time");
	state = 2;
	if mouse_check_button_pressed(mb_left)
	{
		sprite_index = spr_thermo2;
		print("Done");
	}
}
