global.drop_interval = 10; 
global.drop_counter = 0;
global.drop_score = 0;


timer = 0;
dropCooldown = 280
// Arrays of food objects, add more when needed. 
array_chicken = [obj_chicken_fillet_raw];
array_meat = [obj_bacon_raw, obj_beef_raw];
array_veg = [obj_carrot, obj_lettuce, obj_tomato, obj_mushroom];

// --- DIFFICULTY --- 
array_fish = [obj_raw_salmon];


food_options = ["chicken", "meat", "vegetables", "fish"];


function dropFood(){
	print(global.drop_counter)
	print(global.drop_interval);
	if (global.drop_counter < global.drop_interval){
		scr_food_drop();
		timer = 0;
	}else{
		miniHand.minigameStatus = status.finished;
		timer = -9999;
	}
	
}
