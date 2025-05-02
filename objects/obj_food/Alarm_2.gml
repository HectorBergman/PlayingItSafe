if obj_stoveControl != stoveState.low{
			alarm[2] = -1;
}

obj_food.state++;
if state == 3
{
	alarm[2] = -1;
}
else
{
	alarm[2] = timer;
}