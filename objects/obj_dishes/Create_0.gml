
depth = 10;
sprite_index = spr_dishes;

wash_time = 180;      // 1 second at 60 FPS
washTimer = 0;
tween = noone;
start = false;
board = noone;

enum dishState {
	idle,
	acceptingBoard,
	washing,
	rejectingBoard,
	returningBoard,
	waitingForBoard,
	inactive,
}

state = dishState.idle;

handler = instance_find(obj_minigameHandler, 0);

if (miniHand.difficulty < 2) {   
	visible = false;
    state = dishState.inactive
}