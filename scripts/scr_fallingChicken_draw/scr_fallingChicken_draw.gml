function minigame_fallingChicken_control_draw(){
	switch (minigameStatus){
		case status.started: minigame_fallingChicken_create_draw(); break;
		case status.ongoing: minigame_fallingChicken_step_draw(); break;
		case status.finished: minigame_fallingChicken_finish_draw(); break;
		case status.none: break;
	}
}
function minigame_fallingChicken_create_draw(){


	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(room_width / 2, room_height / 2, "Press Enter to Start");

	
	
}


function minigame_fallingChicken_step_draw(){
	
}

//template for minigames completed, doesnt have to look like this ofc
function minigame_fallingChicken_finish_draw(){
	
	/*draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(room_width / 2, room_height / 2, "Game Over!\nPress R to Restart");
	// Display the score at the top-left corner of the screen
	draw_text(room_width / 2, room_height/2 + 50, 
	"Score: " + string(global.drop_score) + " of max " + string(global.drop_interval - 1));*/

	// TODO: fler options

}

