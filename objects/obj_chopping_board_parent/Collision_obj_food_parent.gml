CHICKENPAUSE
// If food_category has not been set 
// Fetches the food_category that has collided 
// and sets it to be that category
// Else checks if the collided object is the same as category_set
if !held && x == originalCoords[0] && y == originalCoords[1]{
	if (!category_set)
	{
		// Sets the category to be that of the category of food_object collided 
		allowed_category = other.food_category
	
		instance_create_layer(x, y - 64, "Instances", obj_checkmark);
	
		category_set = true;
		global.drop_score += 1;
	}

	else
	{
		if (other.food_category == allowed_category)
		{
			instance_create_layer(x, y - 64, "Instances", obj_checkmark);
			global.drop_score += 1;
		}
		else
		{
			instance_create_layer(x, y - 64, "Instances", obj_wrongmark);
			global.drop_score -= 1;
		}
	}


	// Removes the object from the world. 
	// Good way of handling instances. 
	with (other) instance_destroy();

	with (obj_food_dropper) {
	    // Cancel the scheduled alarm
	    
	    // Execute an immediate drop
		dropFood();
	}
}