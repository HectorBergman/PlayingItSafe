dialogueArray = []
depth = 20
//Create a dialogue array for your minigame and the tutorialYapper and tutorialHandler will scroll through it for
//each step if the handler is set up properly, see examples below on how to set up the dialogueArray for your minigame

//Very short text: no overcomplications. Just explain the basics quickly.



scale = room_width/1920
paddingX = 180*scale;
phoneCircle = summonObject(obj_phoneCircle, [["x", room_width-90], ["y", 490], ["depth", depth+10], ["parent", id]]);

dialogueArray[minigame.kitchen] = createDialogueArray(
"Använd WASD eller piltangenterna för att röra på dig.",
"Tryck på E nära en [scale,1][spr_alert][scale,1] för att interagera och starta spelet"
);

dialogueArray[minigame.dragAndDropFridgeLevels] = createDialogueArray(
"Använd musen för att röra runt pekaren.",
"Håll ner musknappen över en vara för att dra runt den.",
"Stoppa in rätt varor i kylen!",
"",
"Dra termometern till kylen för att mäta temperaturen!",
"Animalistiska produkter rekommenderas att förvaras under 4°C.",
"",
"Det finns begränsat med utrymme i kylen. Prioritera de mest temperaturkänsliga livsmedlena först!",
"",
"Någon har rört på termostaten i kylen! Använd [spr_fridgeButtons_display] för att justera temperaturen inne i kylen.",
""
);

dialogueArray[minigame.fallingChicken] = createDialogueArray(
"",
"Flytta maten med höger & vänster piltangent eller med A & D.",
"Snyggt! Håll nedåtpilen eller S för att få maten att falla snabbare.",
"Håll grönsaker, kyckling, och gris-/nötkött på olika skärbrädor.",
"",
"Håll ner musknappen på en skärbräda och rör på musen för att dra den.",
"Dra en skärbräda till handfatet för att diska den.",
"",
);
dialogueArray[minigame.washingHands] = createDialogueArray(
"",
"Använd musen för att röra på handen",
"Klicka på kranen med musen för att sätta på vattnet",
"Håll handen i vattnet",
"Klicka på tvålen med musen för att ta tvål",
"Tryck på tangenterna som anges för att skrubba händerna",
"",
"Ta av smycken och accessoarer genom att hålla ner musknappen och dra dem till smyckesbrickan",
"",
""
);
dialogueArray[minigame.fryFood] = createDialogueArray(
"Förflytta musen till vredet ([spr_stoveControl])",
"Vrid på vredet för att styra temperaturen av plattan",
"Kött behöver bli tillräckligt varmt. Vänta tills köttet är 72 grader",
"Kött behöver vara 72 grader på insidan i två minuter. Klicka på [scale,0.3][spr_eggTimer][scale,1] för att hålla koll på tiden. När den ringer har två minuter gått.",
"",
"",
"Ibland behöver man flytta termometern själv",
""
);

dialogueNoArray = [0,0,0,0,0,0,0,0,0,0,0];
currentString = "";

skip = false;


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
	text = "[scale," + string(scale) + "][$eee7e7][fnt_bitmap_outline_big]" + currentString;
	toDraw = scribble(text).align(fa_center).outline($000034).wrap(800);
	toDraw.draw(room_width/2,40,typist);
}


function yapper_drawGUI2(){
	text = "[scale,1][$eee7e7][fnt_bitmap_outline_big]" + currentString;
	toDraw = scribble(text).align(fa_center, fa_middle).outline($000034).wrap(800);
	toDraw.draw(1400,130,typist);
}