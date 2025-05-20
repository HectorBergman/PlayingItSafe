
// fall_speed = 1 + 0.5 * difficulty // every step of difficulty leads to 0.5 pixels per frame. 

var handler = instance_find(obj_minigameHandler, 0);
if (instance_exists(handler)) {
	if(miniHand.difficulty >= 2)
	{
		fall_speed = 1;
	}
	else
	{
		fall_speed = 1;
	}
} else {
    fall_speed = 1; // default fallback if handler not found
}

is_active = false;

image_xscale = 2;
image_yscale = 2;

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
	case obj_raw_salmon:
		food_category = "fish";
}