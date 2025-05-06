dialogueArray = []

//Create a dialogue array for your minigame and the tutorialYapper and tutorialHandler will scroll through it for
//each step if the handler is set up properly, see examples below on how to set up the dialogueArray for your minigame

//Very short text: no overcomplications. Just explain the basics quickly.

dialogueArray[minigame.kitchen] = createDialogueArray("Använd WASD eller piltangenterna för att röra på dig.","Tryck på E nära en [scale,0.5][spr_alert][scale,1] för att interagera och starta spelet");

dialogueNo = 0;

function createDialogueArray(){
	var arr = [];
    for (var i = 0; i < argument_count; i++) {
        arr[i] = argument[i]
	}
	return arr;
	
}


function yapper_drawGUI(){
	var text = ""
	text = "[scale,1][$eee7e7][fnt_bitmap_outline_big]" + dialogueArray[miniHand.currentMinigame][dialogueNo];
	var toDraw = scribble(text).align(fa_center, fa_middle).outline($000034);
	toDraw.draw(room_width/2,70);
}