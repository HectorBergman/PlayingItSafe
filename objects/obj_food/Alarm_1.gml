if obj_stoveControl != stoveState.low{
			alarm[1] = -1;
}

obj_food.state++;
if state == 3
{
	alarm[1] = -1;
}
else
{
	alarm[1] = 2 * timer;
}