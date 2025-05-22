// check if player is in correct level

switch (state){
	case dishState.idle:{
    // If Enter is pressed AND a chopping board is selected
		board = instance_place(x,y,obj_chopping_board_parent);
		if board != noone{
			if !board.held{
				sprite_index = spr_dishes_soap;
				board.selected = false;
				board.sprite_index = spr_chopping_board_default;   // Reset to normal sprite
				state = dishState.acceptingBoard;
				tween = TweenFire(board,EaseInQuad,0,false,0,20,"scale",2,0);
				TweenFire(board,EaseInQuad,0,false,0,20,"x",board.x,x+sprite_width/2)
				TweenFire(board,EaseInQuad,0,false,0,20,"y",board.y,y+sprite_height/2)
			}
		}
	}break;
	case dishState.acceptingBoard:{
		if !TweenIsActive(tween){
			state = dishState.washing;
		}
	}break;
	case dishState.washing:{
		washTimer++
		if washTimer == wash_time{
			sprite_index = spr_dishes;
			washTimer = 0;
			state = dishState.rejectingBoard;
			tween = TweenFire(board,EaseOutQuad,0,false,0,20,"scale",0,2);
			/// RESETS BOARD STATE
			board.category_set = false;
			board.allowed_category = "";
		}
	} break;
	case dishState.rejectingBoard:{
		if !TweenIsActive(tween){
			state = dishState.returningBoard;
			tween = TweenFire(board,EaseOutQuad,0,false,10,30,"x",board.x,board.originalCoords[0]);
			TweenFire(board,EaseOutQuad,0,false,10,30,"y",board.y,board.originalCoords[1]);
		}
	}break;
	case dishState.returningBoard:{
		if !TweenIsActive(tween){
			board = noone;
			state = dishState.idle
		}
	}break;
	
}