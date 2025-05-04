
draw_self();

var title = ""
title = "[scale,4][$eee7e7]" + "Playing It Safe \n"

var body = "";

//body = "[scale,1][$eee7e7]Sortera objekten på deras rätta plats\nDu har begränsat med utrymme, så prioritera det viktigaste!\n[scale,0.8]Se till att varorna är förvarade i deras rätta temperatur, du kan mäta temperaturen med termometern: [scale,0.125][spr_thermometer][scale,0.8] och du kan justera temperaturen i kylen genom att klicka på: [scale,0.5][spr_fridgeButtons_display][scale,0.8]\nNedanför ser du en lista på matvaror och deras rekommenderade temperaturer:"; 
var tipsArrayIndex = 0;
var finalText = "";

tipsArrayIndex = 0;
finalText += tipsArray[tipsArrayIndex];
var newText = "";

body = "[scale,2][$eee7e7]" + finalText;
var bodyHeight = 0;
bodyHeight += scribble(title).wrap(bbox_right-bbox_left, bbox_bottom-bbox_top).outline(outlineColor).get_height();
bodyHeight += scribble(body).wrap(bbox_right-bbox_left, bbox_bottom-bbox_top).outline(outlineColor).get_height();
var toDraw = scribble(title+body).wrap(bbox_right-bbox_left, bbox_bottom-bbox_top).outline(outlineColor);
toDraw.draw(x+96*2, y+48*2);
body = "[scale,1][$eee7e7]" + newText;
toDraw = scribble(body).wrap(bbox_right-bbox_left, bbox_bottom-bbox_top).outline(outlineColor)
toDraw.draw(x+96*2, y+12*2+bodyHeight);
