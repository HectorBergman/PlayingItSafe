// Event timer
// timer = 0;
global.drop_interval = 11; // in frames, so 60 frames on 60 fps is 1 second.
global.drop_counter = 0;
global.drop_score = 0;

drop_cooldown = 280;
alarm[1] = drop_cooldown;

// Arrays of food objects, add more when needed. 
array_chicken = [obj_chicken_fillet_raw];
array_meat = [obj_bacon_raw, obj_beef_raw];
array_veg = [obj_carrot, obj_lettuce, obj_tomato, obj_mushroom];


food_options = ["chicken", "meat", "vegetables"];

