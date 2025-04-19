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
	var wrapWidth = 1200;
	var text = ""
	text = "[scale,4][$eee7e7]Tjänade poäng: " + string(totalScore); 
	var toDraw = scribble(text).wrap(wrapWidth).align(fa_center);
	toDraw.draw(window_get_width()/2, 750);
	
	
	if arguments != noone{
		for (var i = 0; arguments[i] != noone; i++;) {
			text = "[scale,2][$eee7e7]" + string(arguments[i][0]) + ": " + string(arguments[i][1]);
			toDraw = scribble(text).wrap(wrapWidth).align(fa_center);
			toDraw.draw(window_get_width() / 2, 850+50*i);
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
