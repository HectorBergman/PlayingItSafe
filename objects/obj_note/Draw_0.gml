
draw_self();

var title = ""
title = "[scale,2][$eee7e7]" + "Chilling \n"

var body = "";

//body = "[scale,1][$eee7e7]Sortera objekten på deras rätta plats\nDu har begränsat med utrymme, så prioritera det viktigaste!\n[scale,0.8]Se till att varorna är förvarade i deras rätta temperatur, du kan mäta temperaturen med termometern: [scale,0.125][spr_thermometer][scale,0.8] och du kan justera temperaturen i kylen genom att klicka på: [scale,0.5][spr_fridgeButtons_display][scale,0.8]\nNedanför ser du en lista på matvaror och deras rekommenderade temperaturer:"; 
var tipsArrayIndex = 0;
var finalText = "";

tipsArrayIndex = 0;
finalText += tipsArray[tipsArrayIndex];
var newText = "";
if miniHand.difficulty >= 4 {
	tipsArrayIndex = 1;
	
	if miniHand.dndRead[0]{
		finalText += "\n"+tipsArray[tipsArrayIndex];
	}else{
		newText += "\n"+tipsArray[tipsArrayIndex];
	}
}
if miniHand.difficulty >= 8{
	tipsArrayIndex = 2;
	if miniHand.dndRead[1]{
		finalText += "\n"+tipsArray[tipsArrayIndex];
	}else{
		newText += "\n"+tipsArray[tipsArrayIndex];
	}
}
if miniHand.difficulty >= 12{
	tipsArrayIndex = 3;
	if miniHand.dndRead[2]{
		finalText += "\n"+tipsArray[tipsArrayIndex];
	}else{
		newText += "\n"+tipsArray[tipsArrayIndex];
	}
}
body = "[scale,1][$eee7e7]" + finalText;
var bodyHeight = 0;
bodyHeight += scribble(title).wrap(bbox_right-bbox_left, bbox_bottom-bbox_top).outline(outlineColor).get_height();
bodyHeight += scribble(body).wrap(bbox_right-bbox_left, bbox_bottom-bbox_top).outline(outlineColor).get_height();
var toDraw = scribble(title+body).wrap(bbox_right-bbox_left, bbox_bottom-bbox_top).outline(outlineColor);
toDraw.draw(x+96, y+48);
body = "[scale,1][$eee7e7]" + newText;
toDraw = scribble(body).wrap(bbox_right-bbox_left, bbox_bottom-bbox_top).outline(outlineColor).flash($5dceee, glowTween);
toDraw.draw(x+96, y+12+bodyHeight);

/*var temperaturesListName = "";
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


toDraw = scribble("[scale,1][$eee7e7]°C\n°C\n°C\n°C\n°C\n°C\n°C").wrap(bbox_right-bbox_left, bbox_bottom-bbox_top).outline(outlineColor);
toDraw.draw(x+96+extraWidth,y+48+bodyHeight);
*/


