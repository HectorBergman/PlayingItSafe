//This will run every time game is booted, if some other object is needed on bootup,
//please summon using this object.
timer = 0;
global.masterVolume = 1; //todo: add sfx and music volume

window_set_cursor(cr_none); //hide pc cursor todo: replace cursor with something fun :))
//room_goto(rm_kitchen); //change this when we want menu

window_set_size(display_get_width(),display_get_height());

summonObject(obj_cam, [["swag", true], ["x", 100]])

var seed = (date_current_datetime()) * 1000000;
random_set_seed(seed);
scribble_font_bake_outline_4dir("fnt_fibberish", "fnt_fibberish_outline",$000023, false)
scribble_font_set_default("fnt_fibberish_outline");