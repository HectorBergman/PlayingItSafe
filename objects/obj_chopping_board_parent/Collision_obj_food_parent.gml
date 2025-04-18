
// If food_category has not been set 
// Fetches the food_category that has collided 
// and sets it to be that category
// Else checks if the collided object is the same as category_set

if (!category_set)
{
	// Sets the category to be that of the category of food_object collided 
	allowed_category = other.food_category
	
	instance_create_layer(x, y - 32, "Instances", obj_checkmark);
	
	category_set = true;
	global.drop_score += 1;
}

else
{
	if (other.food_category == allowed_category)
	{
		instance_create_layer(x, y - 32, "Instances", obj_checkmark);
		global.drop_score += 1;
	}
	else
	{
		instance_create_layer(x, y - 32, "Instances", obj_wrongmark);
		global.drop_score -= 1;
	}
}


// Removes the object from the world. 
// Good way of handling instances. 
with (other) instance_destroy();

with (obj_food_dropper) {
    // Cancel the scheduled alarm
    alarm[1] = -1;
    // Execute an immediate drop
	if (global.drop_counter < global.drop_interval-1){

		scr_food_drop();
		// Reset the alarm for the next drop
		alarm[1] = drop_cooldown;
	}else{
		miniHand.minigameStatus = status.finished;
	}
}