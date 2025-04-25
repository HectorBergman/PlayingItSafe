depth = -1000
holding = false;
heldObject = noone;

xRelative = 0;
yRelative = 0;

recencyGrabbedDepth = 999;

scrub_count = 0;
scrub_timer = 0;


scrubKey1 = "E";
scrubKey2 = "Q";
scrubKey3 = "F";
scrubKey4 = "H";

// Define hand states
enum HandState {
    DIRTY,
    WET,
    SOAP,
	SCRUB1,
	SCRUB2,
	SCRUB3,
	SCRUB4,
	RINSE,
	DRY,
}

// Start in dirty state
hand_state = HandState.DIRTY;



function washingHandsText(newText){
	//todo: customize
	var wrapWidth = 1200;
	var text = ""
	text = "[scale,2][$eee7e7]"+string(newText); //$eee7e7 is color in hexadecimal, change this to change text color
	var toDraw = scribble(text).wrap(wrapWidth);
	toDraw.draw(10, 10); //x and y coordinate where text will be drawn
	//fråga Hector om ni undrar något mer
}
