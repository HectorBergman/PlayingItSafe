// check if player is in correct level
var handler = instance_find(obj_minigameHandler, 0);
if (instance_exists(handler)) 
{
    if (handler.fallingChickenDifficulty >= 3) 
	{    
        visible = true;
    } else {
        visible = false;
    }
}

if (visible && !washing) {
    // If Enter is pressed AND a chopping board is selected
    var board = noone;
	
    with (obj_chopping_board_parent) {
        if (selected) {
            board = id;
        }
    }
	
    if (board != noone && keyboard_check_pressed(vk_enter)) {
        washing = true;
        sprite_index = spr_dishes_soap;
        board.selected = false;
        board.sprite_index = spr_chopping_board_chicken;   // Reset to normal sprite
        alarm[4] = wash_time;
    }
}
