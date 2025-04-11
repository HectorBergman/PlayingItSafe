x = mouse_x;
y = mouse_y;

if place_meeting(x, y, obj_food) && obj_food.sprite_index == spr_raw
{
	print("Food is raw, you still have to wait");
}


if place_meeting(x, y, obj_food) && obj_food.sprite_index == spr_partial
{
	print("Food is cooking, Getting closer");
}


if place_meeting(x, y, obj_food) && obj_food.sprite_index == spr_done
{
	print("Food has reached temperature, but has it been enough time");
	if obj_food.check_timer <= 100 and keyboard_check_pressed(ord("A"))
	{
		print("Still not enough time");
	}
}
