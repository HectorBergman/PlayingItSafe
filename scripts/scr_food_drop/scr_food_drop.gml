//@function drop_food()
//@description Spawns random food objects 

function scr_food_drop(){	 
	
	// Randomly assign a category of food
	if (miniHand.minigameStatus == status.ongoing){
		
	
		// --- DIFFICULTY --- 
		// what food categories are "allowed" at certain levels. 
		var category_pool = [];
	
		

		if (miniHand.difficulty < 2) 
		{
			category_pool = ["chicken", "meat", "vegetables"];
		} else {
			category_pool = ["chicken", "meat", "vegetables", "fish"];	
		}
		
		
		// var food_category = food_options[irandom(array_length(food_options) - 1)];
		var food_category = category_pool[irandom(array_length(category_pool) - 1)];
		var food_objects_array = [];
	
			switch(food_category) 
			{
			
				case "meat":
					food_objects_array = array_meat;
					break;
				case "vegetables":
					food_objects_array = array_veg;
					break;
				case "chicken":
					food_objects_array = array_chicken;
					break;
				case "fish":
					food_objects_array = array_fish;
			}
		
		
		
		// Instantiate food, i.e 
		// Choose a random object from category 
	
		var food_object; 
		food_object = food_objects_array[irandom(array_length(food_objects_array) - 1)];
	
		// Create random x position in which food object falls 
		// var x_pos = random_range(room_width/3, room_width/3*2);
		var margin = room_width / 8;
		var x_pos = random_range(room_width / 2 - margin, room_width / 2 + margin);
	
		// Create instance of this food object
		var food_obj = instance_create_layer(x_pos, -32, "Instances", food_object); // Hard coded the y-position. Could be changed later 
		food_obj.is_active = true;
	
		global.drop_counter += 1;
		
	
		// Deactivate other parent object 
		// TODO: fix 
		with (obj_food_parent)
		{
			if(id != food_obj.id) // if current id is not the instance of this id 
			{
				is_active = false;
			}
		}
		if (global.drop_counter > global.drop_interval) 
		{
			//room_goto(rm_falling_chicken_end);
			miniHand.minigameStatus = status.finished;
			return;
		}
	}
}
