//This will run every time game is booted, if some other object is needed on bootup,
//please summon using this object.
timer = 0;


window_set_cursor(cr_none); //hide pc cursor todo: replace cursor with something fun :))
room_goto(rm_kitchen); //change this when we want menu

window_set_size(display_get_width(),display_get_height());

summonObject(obj_cam, [["swag", true], ["x", 100]])
