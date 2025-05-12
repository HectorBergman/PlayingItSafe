/// @description Insert description here
// You can write your code in this editor
/*draw_text(20,20,difficulty);
draw_text(30,20,dndRead[0]);
draw_text(40,20,dndRead[1]);
draw_text(50,20,dndRead[2]);*/
switch (currentMinigame){
    case minigame.fallingChicken: minigame_fallingChicken_control_draw_gui(); break;
	case minigame.fryFood: minigame_fryFood_control_draw_gui(); break;
	case minigame.dragAndDropFridgeLevels: minigame_dnd_control_draw_gui(); break;
	case minigame.washingHands: minigame_WH_control_draw_gui(); break;
	default: break;
}

