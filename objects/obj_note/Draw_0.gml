draw_self();

var title = ""
title = "[scale,2][$eee7e7]" + "Chilling \n"

var body = "";
body = "[scale,1][$eee7e7]Sortera objekten på deras rätta plats\nDu har begränsat med utrymme, så prioritera det viktigaste!\n[scale,0.8]Nedanför ser du en lista på matvaror och deras rekommenderade temperatur:"; 

var bodyHeight = 0;
bodyHeight += scribble(title).get_height()*1.2;
bodyHeight += scribble(body).get_height();
var toDraw = scribble(title+body).wrap(bbox_right-bbox_left, bbox_bottom-bbox_top).outline(outlineColor);
toDraw.draw(x+96, y+48);

var temperaturesListName = "";
temperaturesListName = "[scale,1][$eee7e7]" + temperatureText[0];

var listNameWidth = scribble(temperaturesListName).get_width();

var temperaturesListLowestTemp = "";
temperaturesListLowestTemp = "[scale,1][$eee7e7]" + temperatureText[1];

var listLowestTempWidth = scribble(temperaturesListLowestTemp).get_width();

var temperaturesListDashes = "";
temperaturesListDashes = "[scale,1][$eee7e7]" + temperatureText[3];

var listDashesWidth = scribble(temperaturesListDashes).get_width();

var temperaturesListHighestTemp = "";
temperaturesListHighestTemp = "[scale,1][$eee7e7]" + temperatureText[2];

toDraw = scribble(title+body).wrap(bbox_right-bbox_left, bbox_bottom-bbox_top).outline(outlineColor);


var listHighestTempWidth = scribble(temperaturesListHighestTemp).get_width();
var extraWidth = 0;
toDraw = scribble(temperaturesListName).wrap(bbox_right-bbox_left, bbox_bottom-bbox_top).outline(outlineColor);
toDraw.draw(x+96+extraWidth,y+48+bodyHeight);

extraWidth += listNameWidth+24
toDraw = scribble(temperaturesListLowestTemp).wrap(bbox_right-bbox_left, bbox_bottom-bbox_top).outline(outlineColor);
toDraw.draw(x+96+extraWidth,y+48+bodyHeight);

extraWidth += listLowestTempWidth+24
toDraw = scribble(temperaturesListDashes).wrap(bbox_right-bbox_left, bbox_bottom-bbox_top).outline(outlineColor);
toDraw.draw(x+96+extraWidth,y+48+bodyHeight);

extraWidth +=  listDashesWidth+24
toDraw = scribble(temperaturesListHighestTemp).wrap(bbox_right-bbox_left, bbox_bottom-bbox_top).outline(outlineColor);
toDraw.draw(x+96+extraWidth,y+48+bodyHeight);

extraWidth += listHighestTempWidth + 24;


toDraw = scribble("[scale,1][$eee7e7]°C\n°C\n°C\n").wrap(bbox_right-bbox_left, bbox_bottom-bbox_top).outline(outlineColor);
toDraw.draw(x+96+extraWidth,y+48+bodyHeight);



