//This will run every time game is booted, if some other object is needed on bootup,
//please summon using this object.
timer = 0;
global.masterVolume = 0.3; //todo: add sfx and music volume

global.alertsPaused = false;
gpu_set_texfilter(false);

window_set_cursor(cr_none); //hide pc cursor todo: replace cursor with something fun :))


window_set_size(display_get_width(),display_get_height());

summonObject(obj_cam, [["swag", true], ["x", 100]])

var seed = (date_current_datetime()) * 1000000;
random_set_seed(seed);
scribble_font_bake_outline_and_shadow("fnt_bitmap", "fnt_bitmap_outline",0,0, SCRIBBLE_OUTLINE.EIGHT_DIR_THICK ,0,false);
scribble_font_bake_outline_and_shadow("fnt_bitmap_big", "fnt_bitmap_outline_big",0,0, SCRIBBLE_OUTLINE.EIGHT_DIR_THICK ,0,false);
scribble_font_bake_outline_and_shadow("fnt_bitmap_huge", "fnt_bitmap_outline_huge",0,0, SCRIBBLE_OUTLINE.EIGHT_DIR_THICK ,0,false);
/*scribble_font_bake_outline_8dir_2px("fnt_bitmap", "fnt_bitmap_outline",$000023, false)
scribble_font_bake_outline_8dir_2px("fnt_bitmap", "fnt_bitmap_outline_bright",$000034, false)
scribble_font_bake_outline_8dir_2px("fnt_bitmap_huge", "fnt_bitmap_outline_huge",$000023, false)
scribble_font_bake_outline_8dir_2px("fnt_bitmap_huge", "fnt_bitmap_outline_bright_huge",$000034, false)*/
scribble_font_set_default("fnt_bitmap_outline");

