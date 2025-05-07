dialogueArray = []
depth = -10000
//Create a dialogue array for your minigame and the tutorialYapper and tutorialHandler will scroll through it for
//each step if the handler is set up properly, see examples below on how to set up the dialogueArray for your minigame

//Very short text: no overcomplications. Just explain the basics quickly.
scale = room_width/1920
dialogueArray[minigame.kitchen] = createDialogueArray(
"Använd WASD eller piltangenterna för att röra på dig.",
"Tryck på E nära en [scale,1][spr_alert][scale,1] för att interagera och starta spelet"
);

dialogueArray[minigame.dragAndDropFridgeLevels] = createDialogueArray(
"Använd musen för att röra runt pekaren",
"Håll ner musknappen över en vara för att dra runt den",
"Stoppa in rätt varor i kylen!",
);

dialogueNoArray = [0,0,0,0,0,0,0,0,0,0,0];


skip = false;
prevText = "";
currentText = "";

typist = scribble_typist()//.sound(snd_speak_1, 0, 0.95, 1.05);
typist.in(1, 0);

function createDialogueArray(){
	var lastI = 0;
	var arr = [];
    for (var i = 0; i < argument_count; i++) {
        arr[i] = argument[i]
		lastI = i;
	}
	arr[lastI+1] = "";
	return arr;
	
}


function yapper_drawGUI(){
	text = "[scale," + string(scale) + "][$eee7e7][fnt_bitmap_outline_big]" + dialogueArray[miniHand.currentMinigame][dialogueNoArray[miniHand.currentMinigame]];
	toDraw = scribble(text).align(fa_center).outline($000034);
	toDraw.draw(room_width/2,70,typist);
}