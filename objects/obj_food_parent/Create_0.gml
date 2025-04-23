
fall_speed = 1;
is_active = false;
image_xscale = 2;
image_yscale = 2;
// Sets food_category to each object 

switch (object_index)
{
	case obj_chicken_fillet_raw:
		food_category = "chicken";
		break;
	case obj_bacon_raw:
		food_category = "meat";
		break;
	case obj_beef_raw:
		food_category = "meat";
		break;
	case obj_carrot:
		food_category = "vegetables";
		break;
	case obj_lettuce:
		food_category = "vegetables";
		break;
	case obj_tomato:
		food_category = "vegetables";
		break;
	case obj_mushroom:
		food_category = "vegetables";
		break;
}