draw_self();

var text = ""
text = "[scale," + string(scale) + "][$eee7e7][fnt_bitmap_outline_big]" + key;
var toDraw = scribble(text).align(fa_center, fa_middle).outline($000034);
toDraw.draw(x,y);