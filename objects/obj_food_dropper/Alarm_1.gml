if (global.drop_counter <global.drop_interval){
	scr_food_drop();
	alarm[1] = drop_cooldown;
}else{
	miniHand.minigameStatus = status.finished;
}