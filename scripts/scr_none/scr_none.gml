
function minigame_none_control(){
	print("lol");
	switch (minigameStatus){
		case status.started: minigame_none_create(); break;
		case status.ongoing: minigame_none_step(); break;
		case status.finished: minigame_none_finish(); break;
		case status.none: break;
	}
}

function minigame_none_create(){
	print("lol");
	player = instance_find(obj_player, 0);
	player.x = playerPosition[0];
	player.y = playerPosition[1];
	
	minigameStatus = status.ongoing;
}


function minigame_none_step(){

}


function minigame_none_finish(){

}
