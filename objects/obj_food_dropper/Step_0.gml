timer++;

if (timer >= drop_interval)
{
	timer = 0; // reset timer
	
	// Randomly assign a category of food 
	var food_category = food_options[irandom(array_length(food_options) - 1)];
	
	
	// From string category get the correct array
	var food_objects_array;
	
	switch(food_category) 
	{
		case "meat":
		food_objects_array = array_meat;
		break;
		case "veg":
		food_objects_array = array_veg;
		break;
		case "chicken":
		food_objects_array = array_chicken;
		break;
	}
	
	// Choose a random object from category 
	var food_object; 
	food_object = food_objects_array[irandom(array_length(food_objects_array) - 1)];
	
	// Create random x position in which food object falls 
	var x_pos = random_range(300, 500); // originally: 64, room_width - 64
	
	// Create instance of this food object
	var food_obj = instance_create_layer(x_pos, -32, "Instances", food_object); // Hard coded the y-position. Could be changed later 
	food_obj.is_active = true;
	
	// Deactivate other parent object 
	with (obj_food_parent)
	{
		if(id != food_obj.id) // if current id is not the instance of this id 
		{
			is_active = false;
		}
	}
}