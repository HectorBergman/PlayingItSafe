x = mouse_x;
y = mouse_y;

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
	if obj_food.check_timer <= 100 and mouse_check_button_pressed(mb_left)
	{
		print("Still not enough time");
		state = 3;
	}
	else
	{
		print("Done");
	}
}



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