


draw_set_color(c_white);
                       

// Draw the score

var wrapWidth = 1200;
var text = ""
text = "[scale,3][$eee7e7]Poäng: " + string(global.drop_score); 
var toDraw = scribble(text).wrap(wrapWidth);
toDraw.draw(32, 32);
/*draw_text(room_width / 2 - 200, room_height/2 - 200, 
"Score: " + string(global.drop_score));*/