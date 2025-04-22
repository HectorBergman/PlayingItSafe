function minigame_fallingChicken_control_draw(){
	switch (minigameStatus){
		case status.started: minigame_fallingChicken_create_draw(); break;
		case status.ongoing: minigame_fallingChicken_step_draw(); break;
		case status.finished: minigame_fallingChicken_finish_draw(); break;
		case status.none: break;
	}
}
function minigame_fallingChicken_create_draw(){

	//here goes any code you need to start the minigame
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(room_width / 2, room_height / 2, "Press Enter to Start");

	//this could also have a requirement in-case you want to have an animation or something b4 minigame start
	
}

//template for ongoing minigame handler actions. You can also control the minigame via this
//but I chose to do it via the minigame items instead (obj_dnd_item, obj_doors)
function minigame_fallingChicken_step_draw(){
	var minigameComplete = true;
	
	//if requirements for minigame completion not met:
	minigameComplete = false;
	//or alternatively just have it be false and set to true when conditions met
	
	if minigameComplete{ 
		minigameStatus = status.finished;
	}
}

//template for minigames completed, doesnt have to look like this ofc
function minigame_fallingChicken_finish_draw(){
	
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(room_width / 2, room_height / 2, "Game Over!\nPress R to Restart");
	// Display the score at the top-left corner of the screen
	draw_text(room_width / 2, room_height/2 + 50, 
	"Score: " + string(global.drop_score) + " of max " + string(global.drop_interval - 1));

	// TODO: fler options

}