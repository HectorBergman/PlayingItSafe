draw_self();
var text = "";
var toDraw = noone;
if image_index == 0{
	text = "[scale," + string(scale) + "][$eee7e7][fnt_bitmap_outline_big]" + key;
	toDraw = scribble(text).align(fa_center, fa_middle).outline($000034);
}else{
	text = "[scale," + string(scale*0.9) + "][$d6cfcf][fnt_bitmap_outline_big]" + key;
	toDraw = scribble(text).align(fa_center, fa_middle).outline($000034);
}
toDraw.draw(x,y);