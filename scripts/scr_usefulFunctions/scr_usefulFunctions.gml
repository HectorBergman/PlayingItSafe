/// @function scoreResults(totalScore, arguments = [[noone]])
/// @description Use to display points gained from a minigame, 
///	with any additional info to display put into the arguments array,
///	For more information on how to use arguments array,
///	see: function scoreResults_generateArray
/// @param {real} totalScore total points gained from minigame
/// @param {real} arguments Optional array containing additional arguments
///	[[text, score to be displayed, scale of text, color of text]],
/// see: function scoreResults_generateArray
/// @example scoreResults(10, [scoreResults_generateArray("Avklarade bakåtvoltar: ", 10, "2", "$eee7e7"), noone]);
/// will generate a big text saying Tjänade poäng: 10
/// followed by a smaller text saying Avklarade bakåtvoltar: 10 in white

function scoreResults(totalScore, arguments = [[noone]]){
	if !global.pause{
		draw_set_alpha(0.5);
		draw_set_color(c_black)
		draw_rectangle(0,0,1920,1080,false);
		draw_set_alpha(1);
		draw_set_color(c_white)
		var wrapWidth = 1200;
		var text = ""
		text = "[fnt_bitmap_outline_big][scale,2][$eee7e7]Tjänade poäng: " + string(totalScore); 
		var toDraw = scribble(text).wrap(wrapWidth).align(fa_center);
		toDraw.draw(1920/2, 700);
		var lastI = 0;
	
		if arguments != noone{
			for (var i = 0; arguments[i] != noone; i++;) {
				text = "[fnt_bitmap_outline_big][scale,1][$eee7e7]" + string(arguments[i][0]) + ": " + string(arguments[i][1]);
				toDraw = scribble(text).wrap(wrapWidth).align(fa_center);
				toDraw.draw(1920 / 2, 820+60*i);
				lastI = i;
			}
		}
		try{
			if checkmark.life >= checkmark.lifeTime{
				text = "[fnt_bitmap_outline_big][scale,1.5][$bed6ae]" + "Tryck på valfri tangent för att fortsätta."
				toDraw = scribble(text).align(fa_center);
				toDraw.draw(1920 / 2, 820+60*(lastI+1));
			}
		}catch(e){
		}
	}
}


/// @function scoreResults_generateArray(text, displayScore, scale = "2", color = "$eee7e7");
/// @description Helper function to scoreResults, generates an entry to scoreResults' arguments array
/// @param {string} text The text to supplement the additional entry to scoreResults
/// @param {real} displayScore Score to display alongside text string
/// @param {real} scale Size of text, preferably an integer. Default: 2
/// @param {string} color Color of text, given in hexadecimal code, starting with a dollar sign
/// https://htmlcolorcodes.com/ to find the hexadecimal code for any color
///	Input this for every index of the array used in scoreResults. Example:
/// scoreResults(1, [scoreResults_generateArray("Text: ", 10), scoreResults_generateArray("Text2: ", 25, 4, "$00ff00)])
///	Will generate the default scoreResults text with score 1, then a smaller text saying
/// "Text: 10", followed by a larger text saying "Text2: 25" in neon green
function scoreResults_generateArray(text, displayScore, scale = "2", color = "$eee7e7"){
	
	return [text, string(displayScore), string(scale), string(color)];
}


function shouldFade(){
	for (var i = 0; i < argument_count; i++) {
        if place_meeting(x,y,argument[i]){
			return true;
		}
	}
	return false;
}